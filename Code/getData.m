function [D] = getData(xcell)
    [r, c] = size(xcell);
    c = c - 1;
    D = zeros(r,c);
    for i = 1:r
        for j = 1:c
            D(i,j) = cell2mat(xcell(i,j));
        end
    end
end