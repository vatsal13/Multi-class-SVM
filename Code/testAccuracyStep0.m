function [count,total,Plabel] = testAccuracyStep0(W,b,TestData,Label)
% Plabel : Predicted Label
% TestData: Xtest ,Label: Ytest
    TestData = full(TestData);
    Plabel = zeros(length(Label),1);
    
    for i= 1:length(TestData)
        pred_label = W * (TestData(i,:)') + b;
        if pred_label > 0
            Plabel(i) = 1;
        else
            Plabel(i) = -1;
        end        
    end
    
    Plabel = Plabel';
    count = 0;
    
    for i = 1:length(Label)
        if Plabel(i) == Label(i)
            count = count+1;
        end
    end
    total = length(Label);
    
end