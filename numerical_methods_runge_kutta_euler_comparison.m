clear all
close all
h = 0.5;
t = 0;
w = 0.5;
e = 0.5;
euler_solutions = [];
runge_kutta_solutions = [];
exact_solutions = [];
for i=1:4
    w = rk(h,t,w);
    runge_kutta_solutions(i) = w;
    e = euler(h,t,w);
    euler_solutions(i) = e;
    t = t + h;
    exact_solutions(i) = g(t);
end
runge_kutta_solutions
euler_solutions
exact_solutions

% differential equation
function v = f(t,y)
    v = y-t^2+1;
end

% this is the exact solution for the differential equation
function y = g(t)
    y = t^2 + 2*t + 1 - 0.5*exp(1)^t;
end

% euler's method
% the value of the function equals the value of the function at the previous point
% plus the value of the derivative at the previous point multiplied by some step size h
function e = euler(h,t,w)
    e = w + h*f(t,w);
end

function r = rk(h,t,w)
    k1 = h*f(t,w);
    k2 = h*f(t+h/2, w+k1/2);
    k3 = h*f(t+h/2, w+k2/2);
    k4 = h*f(t+h, w+k3);
    r = w + (k1+2*k2+2*k3+k4)/6;
end


