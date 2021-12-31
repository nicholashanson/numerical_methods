A = [10 3 1; 3 10 2; 1 2 10];
b = [19; 29; 35];
aug = [A b];
N = length(b);
for j = 1:N
    aug(j,:) = aug(j,:)/aug(j,j)
    for i = 1:N
        if i~= j
            m = aug(i,j)
            aug(i,:)=aug(i,:) - m*aug(j,:)
        end
    end
end
