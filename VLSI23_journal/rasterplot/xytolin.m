function [h] = xytolin(x,y,mr_cnt)

mr_cnt_oneside = sqrt(mr_cnt);
h = (x-1)*mr_cnt_oneside + y;

end
