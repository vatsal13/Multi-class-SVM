function [L] = getLabel(xcell)
    [r, c] = size(xcell);
    L = cell(r,1);
    for i = 1:r
         L(i) = xcell(i,c);
    end
end