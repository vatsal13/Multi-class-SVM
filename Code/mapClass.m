function [A] = mapClass(xa)
[r,c] = size(xa);
A= zeros(r,c);
type = {'bus'; 'saab'; 'opel'; 'van'};
for i=1:r
    A(i,1:c-1) = cell2mat(xa(i,1:c-1));
    for j=1:4
        if isequal( cell2mat(type(j)), cell2mat(xa(i,c)))
            A(i,c) = j;    
        end
    end
end
end