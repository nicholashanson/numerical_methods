% in this code we try to solve a system using jacobi
% at first the system is not strictly diaganolly dominant
% this causes the algorithm to fail as return solutions diverge
% to solve this problem we perform a row-swap on the system
% this gives us a strictly diaganolly dominant system (the abolute value
% of the diaganol element on each row is larger than the sum of the absolute
% value of the other elements on that row)
% as a result, the solutions converge to the correct result

close all
clear all

X = [0 0];
solutions_x1 = [];
solutions_x2 = [];
for k = 1:7
    current_x1 = X(1);
    X(1) = next_x1(X(2));
    X(2) = next_x2(current_x1);
    solutions_x1(k) = X(1);
    solutions_x2(k) = X(2);
end
% divergent solutions
solutions_x1
solutions_x2

A = [1 -5; 7 -1];
t = is_strictly_diagonally_dominant(A)
% switch the rows in the system to make it strictly diaganolly dominant
A([1 2]) = A([2 1]);
t = is_strictly_diagonally_dominant(A)

% reset inital values
X(1) = 0;
X(2) = 0;
% now the system is strictly diaganolly dominant the solutions will converge
for k = 1:7
    current_x1 = X(1);
    X(1) = next_x1_1(X(2));
    X(2) = next_x2_1(current_x1);
    solutions_x1(k) = X(1);
    solutions_x2(k) = X(2);
end
% covergent solutions
solutions_x1
solutions_x2

% divergent non-solutions for x1 
function x1 = next_x1(x)
    x1 = -4 + 5*x;
end

% divergent non-solutions for x2
function x2 = next_x2(x)
    x2 = -6 + 7*x;
end

% solution for next iteration of x1 derived from the first row of our strictly diaganolly dominant matrix
function x1_1 = next_x1_1(x)
    x1_1 = (6/7) + (x/7);
end

% solution for next iteration of x2 derived from the first row of our strictly diaganolly dominant matrix
function x2_1 = next_x2_1(x)
    x2_1 = (4/5) + (x/5);
 end

% A = [a11 a12
%      a21 a22]
% if |a11| > |a12| and |a22| > |a21|
% then the system is strictly diaganolly dominant
function t = is_strictly_diagonally_dominant(A)
    for k = 1:size(A,1)
        sum = 0
        for j = 1:size(A,1)
            if k~=j
                % sum up all the elements on the row except for the diaganol one
                sum = sum + abs(A(k,j))
            end
        end
        if sum > abs(A(k,k))
            t = false;
            % the system is not strictly diaganolly dominant so return false
            return
        end
    end
    t = true;
end
