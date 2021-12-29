% this code uses three points to calculate a second-order lagrange interpolation

clear all
close all
% point 1
x0 = 1;
% point 2
x1 = 3;
% point 3
x2 = 5;
% function value at point 1
f0 = 1;
% function value at point 2
f1 = 9;
% function value at point 3
f2 = 25;
% array that holds the points of our interpolation
% index is the x value, value is the function value
r = [];
for i = 1:5
    % get the points of the interpolation one-by-one
    r(i) = lagrange(x0,x1,x2,f0,f1,f2,i)
end
% plot the interpolation
plot(r)

function l = lagrange(x0,x1,x2,f0,f1,f2,x)
    l0 = (((x - x1)*(x - x2))/((x0 - x1)*(x0 - x2)))*f0;
    l1 = (((x - x0)*(x - x2))/((x1 - x0)*(x1 - x2)))*f1;
    l2 = (((x - x0)*(x - x1))/((x2 - x0)*(x2 - x1)))*f2;
    l = l0 + l1 + l2;
end
