function [W,b,E] = svmHyperplane(Xtrain,Ytrain,c)
% Xtrain : features
% Ytrain : labels
% c : constant/free variable
    Xtrain = full(Xtrain);
    [N,M] = size(Xtrain);
    Q = [eye(M) zeros(M,N+1); zeros(N+1,M) zeros(N+1,N+1)];
    C = [zeros(M+1,1); c*ones(N,1)];
    G = [-1*ones(N,1);zeros(N,1)];
    A = genA(Xtrain, Ytrain, N, M);
    Z = quadprog(Q,C,A,G);
    Z_trans = Z';
    W = Z_trans(1:M);
    b = Z_trans(M+1);
    E = Z_trans(M+2:N+M+1);
end