close all;
clear all;
N = 1000000;
epsilon = 0.00001;
A = [8 -3 2 20; 4 11 -1 33; 2 1 4 12];
n = size(A,1)
x = zeros(n,1);
P0 = 0;
P = 0;
for k = 1:N
    for i = 1:n
        sum = 0;
        prev = P;
        for j = 1:n
            sum = sum + A(i,j)*x(j);
        end
        P = (A(i,n+1) - sum) / A(i,i);
        P0 = abs(P) - abs(prev);
        x(i) = x(i) + P
        if abs(P0) < epsilon
            return
        end
    end
end
