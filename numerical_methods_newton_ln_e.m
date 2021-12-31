% find x and y values to solve equalities with ln and e

clear all
close all
x = 1; y = 2;
for k = 1:100
    n = newton();
    m = subs(n);
    x = x - m(1);
    y = y - m(2);
    eval(x)
    eval(y)
end

function n = newton()
    syms x y
    j = jacobian([log(x)+log(y)-1.791759469,exp(1).^(x)+exp(1).^(y)-27.47459302],[x,y]);
    i = inv(j);
    f = [log(x)+log(y)-1.791759469 exp(1).^(x)+exp(1).^(y)-27.47459302];
    n = i*transpose(f);
end
