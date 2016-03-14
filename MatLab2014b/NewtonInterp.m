function res = NewtonInterp(args, funcVal, value)
    N = length(args);
    DIFF = funcVal;
    for  k = 1 : N-1
        for i = 1: N - k
            DIFF(i) = (DIFF(i+1) - DIFF(i)) / (args(i+k) - args(i));
        end
    end
    
    res = DIFF(1) * ones(size(value));
    for k = 2 : N
        res = DIFF(k) + (value - args(k)) .* res;
    end
end