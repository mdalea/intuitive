# intuitive
All the files used during the INTUITIVE project.

# BioCAS22
 - MATLAB files used in BioCAS22 paper: https://ieeexplore.ieee.org/document/9948546
   - texture image to tactile sensor data
   - sensor to spikes/frames   

 - Used Kylberg image texture datasets transformed into multi-sensor data (8x8 channels) as input to a modelled spike and frame-based tactile sensor readout.
 - Spikes are used for classification using a Spiking Neural Network trained with Surrogate Gradient (from: Ali Safa).
 - Frames are classified using a classic vanilla Recurrent Neural Network.

 - Run -> N_PA_gen_apdsm_tau_small_sigma_ALL_Kylberg_sweep.m

-------------------------------------------------------
# VLSI23
 - MATLAB files used in VLSI23 paper
   - automated dataset recording -> dataset_workflow_onedac.m
     - texture image to tactile sensor data
     - generate scaled datastream as input for VDACs (used as ideal input for the INTUITIVE chip)
     - automated chip output spikes recording (AER) and address remapping (to fill 12x16 addresses)

  - SNN training code (Python) -> intuitivespikes_snn_sg.py (RUN ON GLIESE SERVER)
      - Texture 180mVpp
    #CUDA_VISIBLE_DEVICES=3 python intuitivespikes_snn_sg.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_4b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_180mvpp_250mvofs_onedac/ --epochs 150 --hidden_size 256 --num_classes 6 --batch_size 32 --tmax_ms 400 --Ts 10 --kfolds 6 --cache yes --save_bestmodel yes
    
    -  Vibration
    #CUDA_VISIBLE_DEVICES=0 python intuitivespikes_snn_sg.py --datasetPath /users/micas/malea/Documents/ArduinoRead_2/ArduinoRead/out/N_3b_allchannels_ALLCLASS_auto_nospkfilter_cleaned_12x16_vibration/ --epochs 150 --hidden_size 128 --num_classes 6 --batch_size 32 --tmax_ms 400 --Ts 10 --kfolds 6 --cache yes --save_bestmodel yes
  - Plots -> slayerperf_plot_Kylberg_chipclassifier.m
     - Requires:
       - 'chip_spikeclassifier' -> SNN training results
       - 'datasetPath' -> spike dataset 
     
