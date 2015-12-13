function [Hyperplane_Arr, Pairs, type] = oneVsOneHyperplane(xaa,xab,xac,xad,xae,xaf,xag,const)
    % N : No. of classes
    N = 4;
    xa = [xaa;xab;xac;xad;xae;xaf;xag];
    [r,c] = size(xa);
    Pairs = choose2(1:N);
    L = length(Pairs);
    type = {'bus'; 'saab'; 'opel'; 'van'};
    Hyperplane_Arr = zeros(L,c);
    Data = getData(xa);
    Label = getLabel(xa);
    for i=1:L
        tmpData = zeros(r,c-1);
        tmpLabel = zeros(r,1);
        for j = 1:r
            if  isequal(cell2mat(type(Pairs(i,1))), cell2mat(Label(j)))
                tmpData(j,1:c-1) = Data(j,:);
                tmpLabel(j) = 1;          
            elseif isequal(cell2mat(type(Pairs(i,2))), cell2mat(Label(j)))
                tmpData(j,1:c-1) = Data(j,:);
                tmpLabel(j) = -1;
            end
        end
        tmpData( ~any(tmpData,2), : ) = [];  %rows
        tmpLabel( ~any(tmpLabel,2), : ) = [];  %rows
        [W,b] = svmHyperplane(tmpData,tmpLabel,const);
        Hyperplane_Arr(i,:) = [W,b];
    end
end