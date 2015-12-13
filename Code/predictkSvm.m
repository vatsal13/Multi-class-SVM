function [Labels] = predictkSvm(Hyperplane_Arr, xaaTest)
    [r,c] = size(xaaTest);
    [m,n] = size(Hyperplane_Arr);
    TestData = getData(xaaTest);
    Labels = cell(r,1);
    type = {'bus'; 'saab'; 'opel'; 'van'};
    for i=1:r
        max = Hyperplane_Arr(1,1:n) * (TestData(i,:)');
        
        for j=1:m
            tmp = Hyperplane_Arr(j,1:n) * (TestData(i,:)');
            if tmp >= max
                Labels(i) = type(j);
                max = tmp;
            end         
        end
        
    end
end