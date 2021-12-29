% this code calculates the angles for a four bar mechanism
% given a certain angle for the crank, the algorithm calculates the 
% angles of the link and rocker with the x-axis

clear all
close all
% length of crank
l1 = 1;
% length of link
l2 = 3;
% length of rocker
l3 = 2;
% length of base
l4 = 3;
% crank angle
theta1 = 270;
% initial guesses for link angle and rocker angle
x = [29,70];
% k iterations to get answer
for k = 1:1000
    n = newton(theta1,l1,l2,l3,l4);
    theta2 = x(1);
    theta3 = x(2);
    m = subs(n);
    % new estimates for link and rocker angles
    x(1) = x(1) - m(1)
    x(2) = x(2) - m(2)
end

function n = newton(theta1,l1,l2,l3,l4)
    syms theta2 theta3
    j = jacobian([l1*cosd(theta1)+l2*cosd(theta2)-l3*cosd(theta3)-l4,l1*sind(theta1)+l2*sind(theta2)-l3*sind(theta3)],[theta2,theta3]);
    i = inv(j); 
    f = [l1*cosd(theta1)+l2*cosd(theta2)-l3*cosd(theta3)-l4 l1*sind(theta1)+l2*sind(theta2)-l3*sind(theta3)];
    n = i*transpose(f);
end
