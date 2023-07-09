function [ c_2, c_3 ] = sample_entropy(series,r,m )
%PHI 此处显示有关此函数的摘要
%   此处显示详细说明
N = length(series);
d = zeros(N, N);
for i=1:N
    for j=1:N
       if (i~=j) && ( abs(series(1,i)-series(1,j))<=r ) 
          d(i,j) = 1; 
       end
    end
end

b_2 = [];
for i=1:N-m+1
   tmp = 0;
   for j=1:N-m+1
      tmp = tmp + d(i,j) * d(i+1,j+1);
   end
   b_2 = [b_2, tmp];
end
c_2 = mean(b_2 / (N - m));

b_3 = [];
for i=1:N-m
   tmp = 0;
   for j=1:N-m
      tmp = tmp + d(i,j) * d(i+1,j+1) * d(i+2,j+2);
   end
   b_3 = [b_3, tmp];
end
c_3 = mean(b_3 / (N - m - 1));

end

