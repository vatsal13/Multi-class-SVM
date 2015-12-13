function [B] = choose2(A)
% N choose 2
    l = length(A);
    B = [];
    if l>1
        for i=2:l
            B = [B;[A(1),A(i)]];
        end
        B = [B;choose2(A(2:l))];
    end
end