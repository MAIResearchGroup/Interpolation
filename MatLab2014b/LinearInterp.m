function [ res ] = LinearInterp( arguments, functionValues, value )
    koeff = ones([1, 2]);
    
    for i = 2:length(arguments)
        if(value >= arguments(i-1)) && (value <= arguments(i)) 
            koeff(1) = (functionValues(i) - functionValues(i-1)) / (arguments(i) - arguments(i-1));
            koeff(2) = functionValues(i-1) - koeff(1)*arguments(i-1);
        end
    end
    res = koeff(2) + koeff(1)*value;
end

