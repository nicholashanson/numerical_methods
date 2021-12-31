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
solutions_x1
solutions_x2

A = [1 -5; 7 -1];
t = is_strictly_diagonally_dominant(A)
A([1 2]) = A([2 1]);
t = is_strictly_diagonally_dominant(A)

X(1) = 0;
X(2) = 0;
for k = 1:7
    current_x1 = X(1);
    X(1) = next_x1_1(X(2));
    X(2) = next_x2_1(current_x1);
    solutions_x1(k) = X(1);
    solutions_x2(k) = X(2);
end
solutions_x1
solutions_x2

function x1 = next_x1(x)
    x1 = -4 + 5*x;
end

function x2 = next_x2(x)
    x2 = -6 + 7*x;
end

function x1_1 = next_x1_1(x)
    x1_1 = (6/7) + (x/7);
end

function x2_1 = next_x2_1(x)
    x2_1 = (4/5) + (x/5);
 end

function t = is_strictly_diagonally_dominant(A)
    for k = 1:size(A,1)
        sum = 0
        for j = 1:size(A,1)
            if k~=j
                sum = sum + abs(A(k,j))
            end
        end
        if sum > abs(A(k,k))
            t = false;
            return
        end
    end
    t = true;
end
