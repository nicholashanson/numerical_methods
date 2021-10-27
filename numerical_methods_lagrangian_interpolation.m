clear all
close all
% function inputs
x = [1 2 3 4 5]
% function outputs
y = [1 4 9 16 25]
n = length(x)
% x value to be found
tx = 1.5;
sum = 0;
for i = 1:n
    product = 1;
    for j = 1:n
        if j == i
            continue
        end
        product = product * ((tx - x(j))/(x(i) - x(j)));
    end
    sum = sum + product * y(i)
end
