function [Labels] = predictOneVsOne(TestData, Hyperplane_Arr, Pairs, type)
    TestData = getData(TestData);
    [L,W] = size(Hyperplane_Arr);
    [r,c] = size(TestData);
    Labels = cell(r,1);
    for i=1:r
        list = zeros(1,L);
        for j=1:L
            tmp = Hyperplane_Arr(j,1:W-1) * (TestData(i,:)') + Hyperplane_Arr(j,W);
            if tmp>=0
                class = Pairs(j,1);
            else
                class = Pairs(j,2);
            end
            list(j) = class;
        end
        Labels(i) = type(mode(list));
    end
end