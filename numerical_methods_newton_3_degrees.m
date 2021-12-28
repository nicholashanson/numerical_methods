clear all
close all
x = [30,88,4];
for i = 1:1000
    m = newton(2,0,0);
    theta1 = x(1);
    theta2 = x(2);
    theta3 = x(3);
    m = subs(m);
    x(1) = x(1) - m(1);
    x(2) = x(2) - m(2);
    x(3) = x(3) - m(3);
end

function r = newton(x,y,z)
    syms theta1 theta2 theta3
    j = jacobian([cosd(theta3)*(cosd(theta1)+cosd(theta2))-x,sind(theta3)*(cosd(theta1)+cosd(theta2))-y,sind(theta1)+sind(theta2)-z],[theta1,theta2,theta3]);
    i = inv(j);
    f = [cosd(theta3)*(cosd(theta1)+cosd(theta2))-x sind(theta3)*(cosd(theta1)+cosd(theta2))-y sind(theta1)+sind(theta2)-z];
    r = i * transpose(f);
end
