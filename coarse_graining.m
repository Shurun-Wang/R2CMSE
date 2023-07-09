function [ data ] = coarse_graining(series,tau)
%MSE_VALUE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
L = length(series);
N = idivide(int32(L),int32(tau),'floor');
data = zeros(tau,N);

for k=1:tau 
    for i = 1:N
        if i*tau+k-1 > L
            data(k,i)=mean(series( (i-1)*tau+k : end ));
        else
            data(k,i)=mean(series( (i-1)*tau+k : i*tau+k-1 ));
        end
    end
end
end