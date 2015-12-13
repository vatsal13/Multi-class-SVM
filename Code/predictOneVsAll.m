function [Labels] = predictOneVsAll(Hyperplane_Arr, xaaTest)
    [r,c] = size(xaaTest);
    [m,n] = size(Hyperplane_Arr);

    TestData = getData(xaaTest);
    type = {'bus'; 'saab'; 'opel'; 'van'};

    Labels = cell(r,1);
    for i=1:r
        max = Hyperplane_Arr(1,1:n-1) * (TestData(i,:)') + Hyperplane_Arr(1,n);
        for j=1:m
            tmp = Hyperplane_Arr(j,1:n-1) * (TestData(i,:)') + Hyperplane_Arr(j,n);
            if tmp >= max
                Labels(i) = type(j);
                max = tmp;
            end         
        end
    end
    
end
