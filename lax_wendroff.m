function [data] = lax_wendroff(data,datanew,K)
% Update the data according to the first order upwind scheme, iterating
% through the array to alter each value. Wanted to be able to do this with
% elementwise operators to not have a for loop, but each element depends on
% the changes that happened to the element before it, so this does not seem
% possible.
    datanew(1)=data(1);
    datanew(end)=data(end);
    for p = 2 : length(data)
        data(p)=0.5*K*(1+K)*data(p-1)+(1-K*K)*data(p)-0.5*K*(1-K)*(data(p+1));
    end
end
