% a hard-coded system to solve
A = [-3 2 6 4; 10 -7 0 7; 5 -1 5 6];

% get the number of rows
n = size(A,1);

%initialize the determinant
determinant = 1;

for k = 1:n
    [val,ik] = max(A(k,k:n));
    if ik ~= k
        A([ik k],:) = A([k ik],:);
        determinant = determinant * -1;
    end
end

% 第一次迭代的消元因子
L21 = A(2,1)/A(1,1);
L31 = A(3,1)/A(1,1);

% the first line of the matrix is unmodified
B(1,:) = A(1,:);

% the first element of the second row is zero by design
B(2,1) = 0;

% calculate the remaining elements of the second row
B(2,2) = A(2,2) - L21*A(1,2);
B(2,3) = A(2,3) - L21*A(1,3);
B(2,4) = A(2,4) - L21*A(1,4);

% the first element of the third row is zero by design
B(3,2) = A(3,2) - L31*A(1,2);
B(3,3) = A(3,3) - L31*A(1,3);
B(3,4) = A(3,4) - L31*A(1,4);

determinant = determinant * B(1,1);

for k = 1:n
    [val,ik] = max(A(k,k:n));
    if ik ~= k
        A([ik k],:) = A([k ik],:);
        determinant = determinant * -1;
    end
end

% 第二次迭代的消元因子
L32 = B(3,2)/B(2,2)

% the first two rows are unmodified
C(1,:) = B(1,:);
C(2,:) = B(2,:);

C(3,1) = 0;
C(3,2) = 0;

% calulate the remaining elements of row three
C(3,3) = B(3,3) - L32*B(2,3);
C(3,4) = B(3,4) - L32*B(2,4);

% calulate the final solutions
x(3) = C(3,4)/C(3,3);
x(2) = (C(2,4) - C(2,3)*x(3))/C(2,2);
x(1) = (C(1,4) - (C(1,3)*x(3)) - (C(1,2)*x(2)))/C(1,1);

determinant = determinant * C(2,2);
determinant = determinant * C(3,3);
