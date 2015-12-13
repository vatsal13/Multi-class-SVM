function [Hyperplane_Arr] = kClassSvmHyperplane(xaa,xab,xac,xad,xae,xaf,xag,c)
    K = 4;
    
    xa = [xaa;xab;xac;xad;xae;xaf;xag];
    Xtrain = getData(xa);
    Ytrain = getLabel(xa);
    Ytrain = mapClass(Ytrain);

    [N,M] = size(Xtrain);
    Hyperplane_Arr = zeros(K,M);
    Q = [eye(K*M) zeros(K*M,N); zeros(N,K*M) zeros(N,N)];
    C = [zeros(K*M,1); c*ones(N,1)];
    [A,G] = kgenAnG(Xtrain, Ytrain, N, M, K);
    Z = quadprog(Q,C,A,G);
    Z = Z';
    t = 0;
    for i=1:K
        Hyperplane_Arr(i,:) = Z(t+1:t+M);
        t = t + M;
    end
    
end
