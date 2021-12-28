clear all
close all
% initial guess for angle values
x = [30,88,4];
% iterate n times to get final result
for i = 1:1000
    % pass desired co-ordinates (x,y,z) to a function that returns the inverse of the jacobian multiplied by the functions that give the co-ordinates
    m = newton(2,0,0);
    % pass the values for the angles to the symbolic matrix returned above
    theta1 = x(1);
    theta2 = x(2);
    theta3 = x(3);
    m = subs(m);
    % finally subtract the result calculated above from the previous estimates
    x(1) = x(1) - m(1);
    x(2) = x(2) - m(2);
    x(3) = x(3) - m(3);
end

function r = newton(x,y,z)
    % three degrees of freedom (three revolute joints)
    syms theta1 theta2 theta3
    % get the jacobian
    j = jacobian([cosd(theta3)*(cosd(theta1)+cosd(theta2))-x,sind(theta3)*(cosd(theta1)+cosd(theta2))-y,sind(theta1)+sind(theta2)-z],[theta1,theta2,theta3]);
    % invert the jacobian
    i = inv(j);
    % the functions that give the desired co-ordinates
    f = [cosd(theta3)*(cosd(theta1)+cosd(theta2))-x sind(theta3)*(cosd(theta1)+cosd(theta2))-y sind(theta1)+sind(theta2)-z];
    % multiply the inverse of the jacobian with the function vector
    % this vector is subtracted from the previous estimate to get a new estimate
    r = i * transpose(f);
end
