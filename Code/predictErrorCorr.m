function [Labels] = predictErrorCorr(TestData, Hyperplane_Arr, type)

C = [+1,-1,-1,-1,+1,+1,+1;
    -1,+1,-1,-1,+1,-1,-1;
    -1,-1,+1,-1,-1,+1,-1;
    -1,-1,-1,+1,-1,-1,+1];

TestData = getData(TestData);
[L,W] = size(Hyperplane_Arr);
[r,c] = size(TestData);
Labels = cell(r,1);
for i=1:r
    cx = zeros(1,L);
    for j=1:L
        tmp = Hyperplane_Arr(j,1:W-1) * (TestData(i,:)') + Hyperplane_Arr(j,W);
        if tmp>=0
            gx = 1;
        else
            gx = -1;
        end
        cx(j) = gx;
    end
    min_dist = pdist2(cx,C(1,:));
    for k=1:length(type)
        temp = pdist2(cx,C(k,:));
        if temp <= min_dist
            min_dist = temp;
            Labels(i) = type(k);
        end
    end
end

end