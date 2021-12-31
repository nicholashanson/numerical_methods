% here we compare gauss-seidel and jacobi iteration to see which converges faster
% these two methods are almost identical, the only difference being that when calcualting
% x2 gauss-seidel uses the newly calculated value for x1 from the same iteration whereas
% jacobi uses the x1 value from the previous iteration

clear all
close all
gauss_seidel_results_x1 = [];
jacobi_results_x1 = [];
gauss_seidel_results_x2 = [];
jacobi_results_x2 = [];
X = [0 0];
for k = 1:7
    current_x1 = X(1);
    X(1) = next_x1(X(2));
    X(2) = next_x2(current_x1);
    jacobi_results_x1(k) = X(1);
    jacobi_results_x2(k) = X(2);
end
jacobi_results_x1
jacobi_results_x2

X(1) = 0;
X(2) = 0;
for k = 1:7
    X(1) = next_x1(X(2));
    X(2) = next_x2(X(1));
    gauss_seidel_results_x1(k) = X(1);
    gauss_seidel_results_x2(k) = X(2);
end
gauss_seidel_results_x1
gauss_seidel_results_x2

function x1_1 = next_x1(x)
    x1_1 = (6/7) + (x/7);
end

function x2_1 = next_x2(x)
    x2_1 = (4/5) + (x/5);
 end
