function [metric]=get_metric(path,metric_name)
    
    if metric_name == "mean_ser"
        [path,'/mean_ser.csv']
        metric = csvread([path,'/mean_ser.csv'])
    elseif metric_name == "mean_corr_coeff"
        [path,'/mean_correlation_coefficient.csv']
        metric = csvread([path,'/mean_correlation_coefficient.csv'])
    elseif metric_name == "mean_corr_corr"    
        [path,'/correlation_ception_coefficient.csv']
        metric = csvread([path,'/correlation_ception_coefficient.csv'])        
    end

end    