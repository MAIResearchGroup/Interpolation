function [ res ] = LinearInterp( arguments, functionValues, value )
    
    function bool = isValueInRange( value )
        bool = (value >= arguments(1)) && (value <= arguments(length(arguments)));
    end

    function bool = isValueBetween( itemNum, value )
        bool = (value >= arguments(itemNum-1)) && (value <= arguments(itemNum));
    end

    if(isValueInRange(value))
        koeff = ones([1, 2]);

        for i = 2:length(arguments)
            if(isValueBetween(i, value)) 
                koeff(1) = (functionValues(i) - functionValues(i-1)) / (arguments(i) - arguments(i-1));
                koeff(2) = functionValues(i-1) - koeff(1)*arguments(i-1);
            end
        end
        res = koeff(2) + koeff(1)*value;
    else
        % do smth
    end
end

