function [Hyperplane_Arr, type] = errorCorrHyperplane(xaa,xab,xac,xad,xae,xaf,xag,const)
    C = [+1,-1,-1,-1,+1,+1,+1;
        -1,+1,-1,-1,+1,-1,-1;
        -1,-1,+1,-1,-1,+1,-1;
        -1,-1,-1,+1,-1,-1,+1];

    type = {'bus'; 'saab'; 'opel'; 'van'};
    [l,w] = size(C);

    xa = [xaa;xab;xac;xad;xae;xaf;xag];
    [r,c] = size(xa);

    svm_label = zeros(r,1);
    Hyperplane_Arr = zeros(w,c);

    Data = getData(xa);
    Label = getLabel(xa);

    for i=1:w
        for j = 1:r
            for t = 1:l
                if  isequal(cell2mat(type(t)), cell2mat(Label(j)))
                    svm_label(j) = C(t,i);
                end  
            end
        end
        [W,b] = svmHyperplane(Data,svm_label, const);
        Hyperplane_Arr(i,:) = [W,b];
    end
end