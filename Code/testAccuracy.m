function [count,total] = testAccuracy(TestData,Labels)
TestLabels = getLabel(TestData);
L = length(TestLabels);
total = L;
count = 0;
for i=1:L
    if isequal(cell2mat(Labels(i)), cell2mat(TestLabels(i)))
            count = count + 1;
    end
end
end