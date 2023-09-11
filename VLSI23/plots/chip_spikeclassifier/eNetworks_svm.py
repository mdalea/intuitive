"""
Defines Convolutional SNN model
Gesture recognition using 8GHz Radar
Author: Ali Safa - IMEC- KU Leuven, Federico Corradi - IMEC-NL
"""
import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.autograd import Variable



device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
torch.autograd.set_detect_anomaly(True)
gamma = .5  # gradient scale
lens = 0.5
decay_neu = 1 #1 for IF, <1 for LIF


# define approximate firing function
class ActFun(torch.autograd.Function):
    @staticmethod
    def forward(ctx, input):  # input = membrane potential- threshold
        ctx.save_for_backward(input)
        return input.gt(0).float()  # is firing
    
    @staticmethod
    def backward(ctx, grad_output):  # approximate the gradients
        input, = ctx.saved_tensors
        grad_input = grad_output.clone()
        temp = np.exp((-(input) ** 2 / (2 * lens * lens))) / (np.sqrt(2 * np.pi) * lens)
        return gamma * grad_input * temp.float()

act_fun = ActFun.apply

def mem_update_adp(ops, x, mem, thr ):
    mem = decay_neu*mem + ops(x)
    inputs_ = mem - thr
    spike = act_fun(inputs_)#(inputs_ > 0).float()
    mem = mem*(1-spike) # reset
    negative_ = (mem < -thr).float()
    mem = (mem*(1-negative_))-(thr*negative_)
    return mem, spike

def mem_update_NU_adp(inputs, mem, thr):
    mem = decay_neu*mem + inputs
    inputs_ = mem - thr
    spike = act_fun(inputs_)#(inputs_ > 0).float()
    mem = mem*(1-spike) # reset
    negative_ = (mem < -thr).float()
    mem = (mem*(1-negative_))-(thr*negative_)
    return mem, spike

def moving_filt(window_size, stride, hidden_spike_t):

    windows = hidden_spike_t.unfold(2, window_size, stride)
    #print(windows.shape)
    means = windows.mean(dim=3)

    #print(hidden_spike_t)

    #print(means.shape)
    #print(means)
    return means


       
class mini_eMLP(nn.Module):
    #def __init__(self, input_x, input_y, hidden_size_1, output_size, criterion, batch_size):
    def __init__(self, input_ch, input_x, input_y, hidden_size_1, output_size, criterion, batch_size, window_size):
        super(mini_eMLP, self).__init__()
        
        self.criterion = criterion
        self.batch_size = batch_size
        self.hidden_size_1 = hidden_size_1
        self.output_size = output_size
        self.window_size = window_size
        #self.conv1 = nn.Conv2d(1, conv_nbr_1, conv_sz_1)
        #self.l1 = nn.Linear(input_x*input_y, hidden_size_1) 
        #a_c_1_x = input_x - conv_sz_1 + 1
        #a_c_1_y = input_y - conv_sz_1 + 1
        #self.thr_c_1 = nn.Parameter(torch.Tensor(a_c_1_x, a_c_1_y))#, requires_grad=True) #learn threshold
        #self.thr_c_1 = nn.Parameter(torch.Tensor(input_x*input_y, hidden_size_1))#, requires_grad=True) #learn threshold
        #input_size = (a_c_1_x // 2) * (a_c_1_y // 2) * conv_nbr_1
        #input_size = input_x * input_y
        input_size = input_ch * input_x * input_y
        self.i2h = nn.Linear(input_size, hidden_size_1)
        self.h2o = nn.Linear(hidden_size_1, output_size)
        self.h2h = nn.Linear(hidden_size_1, hidden_size_1)
        self.thr_h_1 = nn.Parameter(torch.Tensor(hidden_size_1))#, requires_grad=True) #learn threshold
        self.thr_o = nn.Parameter(torch.Tensor(output_size))

        nn.init.orthogonal_(self.h2h.weight) #initialize weights following Xavier's rule (maintains equal activity variance along the network)
        nn.init.xavier_uniform_(self.i2h.weight)
        nn.init.xavier_uniform_(self.h2o.weight)
        #nn.init.xavier_uniform_(self.conv1.weight)
        #nn.init.constant_(self.conv1.bias, 0)
        nn.init.constant_(self.i2h.bias, 0)
        nn.init.constant_(self.h2h.bias, 0)
        nn.init.constant_(self.h2o.bias, 0)
        #nn.init.constant_(self.thr_c_1, 1.0)
        nn.init.constant_(self.thr_h_1, 1.0)
        nn.init.constant_(self.thr_o, 1.0)





    #def forward(self, input, labels, c_mem1, hidden_mem, c_spike1, hidden_spike, output_mem, output_spike):
    def forward(self, input, labels, hidden_mem, hidden_spike, output_mem, output_spike):

        # Feed in the whole sequence
        #print(input.shape)

        #batch_size, no, input_dim1, input_dim2, T_len = input.shape
        #T_len, batch_size, _ = input.shape
        batch_size, T_len, _ = input.shape

        #print(T_len)
        nbr_events_avrg = torch.zeros(T_len, requires_grad=False)
        loss_h = Variable(torch.Tensor([0]), requires_grad=True)
        predictions = []

        output_spike_sum = torch.zeros(batch_size, self.output_size)
        hidden_spike_t = torch.zeros(batch_size, self.hidden_size_1, T_len, requires_grad=False)
        #output_accumulator = torch.zeros(batch_size, self.output_size)

        for this_t in range(T_len): #BPTT
            #sample randomly the input - 
            input_x = input[:, this_t, :] 

            #print(input_x.shape) 
            h_input = self.i2h(input_x.float()) + self.h2h(hidden_spike)            
            hidden_mem, hidden_spike = mem_update_NU_adp(h_input,hidden_mem, self.thr_h_1)
            output_mem, output_spike = mem_update_adp(self.h2o, hidden_spike, output_mem, self.thr_o)
            hidden_spike_t[:,:,this_t] = hidden_spike
            nbr_events_avrg[this_t] = (torch.sum(output_spike) + torch.sum(hidden_spike))/batch_size
            output_spike_sum[:,:] = output_spike_sum[:,:] + output_spike
            #output_accumulator[:,:] = output_accumulator[:,:] + output_mem

        #################   classification  #########################
        #print(hidden_spike_t.shape)
        hidden_spike_filt = moving_filt(window_size=self.window_size, stride=1, hidden_spike_t=hidden_spike_t)
        #print(hidden_spike_filt.shape)
	
        output_sumspike = F.log_softmax(output_spike_sum,dim=1) #at the end        
        
        pred_ = output_sumspike.argmax(axis=1)
        predictions.append(pred_.data.cpu().numpy())
        loss_h =  self.criterion(output_sumspike.float().to(device), labels.long().to(device))  # else CrossEntropy or NLLLoss
        #torch.unsqueeze(labels.T,0)) # if hinge loss     

        #output_logit = F.log_softmax(output_accumulator,dim=1) #transform to class probabilities through SoftMax        
        #pred_ = output_logit.argmax(axis=1) #determines the class
        #predictions.append(pred_.data.cpu().numpy())
        #loss_h =  self.criterion(output_logit.float().to(device), labels.long().to(device)) #get the loss against the labels

                                        
        loss_ = loss_h.data.cpu().numpy()
        # too noisy
        #print("Current batch loss: "+ str(loss_))
        predictions_t = torch.tensor(predictions)
        return predictions_t, loss_h, nbr_events_avrg, hidden_spike_filt


    def num_flat_features(self, x):
        size = x.size()[1:]  # all dimensions except the batch dimension
        num_features = 1
        for s in size:
            num_features *= s
        return num_features





        
    
    
