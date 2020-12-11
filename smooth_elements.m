function [data] = smooth_elements(data, num_to_average)
% We reason that as the impact from a heat wave travels, at any given time
% the area will attempt to obey Laplace's equation: if static, this results
% in the temperature at any given area being equal to the average of the
% temperatures around it. Because our wave is moving, we reason that a
% decent model for the dissipation of the wave is to go through and conduct
% this average only once rather than until a certain tolerance is met.
    for index = 1 + num_to_average : length(data) - num_to_average
        data(index) = mean(data(index - num_to_average : index + num_to_average));
    end
end

