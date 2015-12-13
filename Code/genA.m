function [A] = genA(XtrainFull, Ytrain, N, M)
    A = zeros(2*N, N+M+1);
    size(A)
    for i=1:N
        A(i,:) = [Ytrain(i)*(XtrainFull(i,:)), Ytrain(i), zeros(1,i-1),1,zeros(1,N-i)];
    end
    for i=1:N
        A(i+N,:) = [zeros(1,M+1), zeros(1,i-1),1,zeros(1,N-i)];
    end
    A = -1*A;
end