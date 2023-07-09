function [ y ] = r2cmse_value(series,r,m,tau)
%MSE_VALUE 此处显示有关此函数的摘要
%   此处显示详细说明
r = r * std(series);
data = coarse_graining(series, tau);

tmp_1 = zeros(1, tau);
tmp_2 = zeros(1, tau);

for i=1:tau
    [c_2, c_3] = sampen(data(i,:), r, m);
    tmp_1(1,i) = c_2;
    tmp_2(1,i) = c_3;
end
tmp_1 = nanmean(tmp_1);
tmp_2 = nanmean(tmp_2);

y = -log(tmp_2/tmp_1);
end
