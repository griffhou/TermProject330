function [new_data] = first_order_upwind(new_data, data, courant_number)
% Update the data according to the first order upwind scheme, iterating
% through the array to alter each value. Wanted to be able to do this with
% elementwise operators to not have a for loop, but each element depends on
% the changes that happened to the element before it, so this does not seem
% possible.
    for index = 2 : length(data)
        new_data(index) = data(index) - courant_number * (data(index) - data(index - 1));
    end
end

