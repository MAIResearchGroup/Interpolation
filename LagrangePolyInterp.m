function [res] = LagrangePolyInterp( arguments, functionValues, value )
    koeff = ones(length(arguments));
    res = 0;
    
    for i = 1:length(arguments)
        for j = 1:length(arguments)
            if(i~=j) 
                koeff(i) = koeff(i) * (value - arguments(j)) / ( arguments(i) - arguments(j));
            end
        end
        res = res + functionValues(i) * koeff(i);
    end
end