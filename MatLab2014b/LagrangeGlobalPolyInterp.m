function [res] = LagrangeGlobalPolyInterp( arguments, functionValues, value )
    
    function bool = isValueInRange( value )
        bool = (value >= arguments(1)) && (value <= arguments(length(arguments)));
    end

    if(isValueInRange(value))
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
    else
        % do smth
    end
end

