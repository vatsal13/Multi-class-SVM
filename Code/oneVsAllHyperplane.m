function[Hyperplane_Arr] = oneVsAllHyperplane(xaa,xab,xac,xad,xae,xaf,xag,const)
    xa = [xaa;xab;xac;xad;xae;xaf;xag];
    [r,c] = size(xa);
    type = {'bus'; 'saab'; 'opel'; 'van'};
    Hyperplane_Arr = zeros(4,c);
    for i = 1:4
        Data = getData(xa);
        Label = getLabel(xa);
        svm_label = zeros(r,1);
        for j = 1:r
            if  isequal(cell2mat(type(i)), cell2mat(Label(j)))
                svm_label(j) = 1;
            else
                svm_label(j) = -1;
            end
        end
        [W,b] = svmHyperplane(Data,svm_label,const);
        Hyperplane_Arr(i,:) = [W,b];
    end
end