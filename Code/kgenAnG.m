function [A,G] = kgenAnG(Xtrain, Ytrain, N, M, K)
    A = zeros(N*K + N, K*M + N);
    G = zeros(N*K + N, 1);
    for i=1:N
        for j=1:K
            if Ytrain(i) == j
                A(i+j,:) = [zeros(1,M*K), zeros(1,i-1), -1, zeros(1,N-i)];
                G(i+j) = -1;
            elseif Ytrain(i) > j
                A(i+j,:) = [zeros(1,M*(j-1)), Xtrain(i,:), zeros(1,M*(Ytrain(i)-j-1)), -1*Xtrain(i,:), zeros(1,M*K - M*Ytrain(i)), zeros(1,i-1), -1, zeros(1,N-i)];
                G(i+j) = 0;
            elseif Ytrain(i) < j
                A(i+j,:) = [zeros(1,M*(Ytrain(i)-1)), -1*Xtrain(i,:), zeros(1,M*(j-Ytrain(i)-1)), Xtrain(i,:), zeros(1,M*K - M*j), zeros(1,i-1), -1, zeros(1,N-i)];
                G(i+j) = 0;
            end

        end
    end

    for i=1:N
        A((N*K)+i,:) = [zeros(1,M*K), zeros(1,i-1), -1, zeros(1,N-i)];
        G((N*K)+i) = 0;
    end

end