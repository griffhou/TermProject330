function [data] = lax_friedrich(new_data,data,K)
% Update the data according to the first order upwind scheme, iterating
% through the array to alter each value. Wanted to be able to do this with
% elementwise operators to not have a for loop, but each element depends on
% the changes that happened to the element before it, so this does not seem
% possible.
    for p = 2 : length(data)-1
        new_data(p)=0.5*(data(p-1)+data(p+1))-0.5*K*(data(p+1)-data(p-1));
    end
end