function [res] = LagrangePolyInterp( arguments, functionValues, value )
    koeff = zeroes(length(arguments));
    
    for i = 1:length(arguments)
        for j = 1:length(arguments)
            if(i~=j) 
                koeff(i) = koeff(i) * (value - argument(j)) / ( argument(i) - argument(j));
            end
        end
        res = res + functionValues(i) * koeff(i);
    end
end

