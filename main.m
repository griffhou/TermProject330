
% Used to keep track of time of execution
tic
%2D animated graph

% graph_video = VideoWriter('graph_video_4.avi');
% open(graph_video);

heatmap_video = VideoWriter('heatmap_video_5.avi');
open(heatmap_video);

%Set 2D Grid
%Change num_spaces and time_increments to go faster but less accurate or for a longer period of
%time
num_spaces = 200; % Determines the "resolution" of the wave and its dispersion
time_increments = 100; % Determines how long the wave runs for
xMin = 0;
xMax = 1; 
x = linspace(xMin, xMax, num_spaces); % Used primarily in plotting the graph
courant_num = 0.7;
%We should eventually find C using a0*DeltaT/DeltaX but oh well. To be
%explained later...

%Pre-set array to speed up execution
u = zeros(num_spaces, 1);

% Set initial conditions, which will propogate in time.
% Can be changed and set as desired.
init_cond=0;
if init_cond == 0 
    for i = 1 : num_spaces    %%potentially one too few
            if x(i) < 0.3 && x(i) > 0.1
                % u(i) = 2*x(i)+2;
                u(i) = 20;
            elseif x(i) >0 && x(i)<0.05
                u(i) = 0;
            else
                u(i) = 0;
            end
    end
end
max_temperature = 20;
to_average = 3;

% Basically u is the array of y values (ie the dependent variable). For each time t
% there is a u value for every x. Therefore at every t the new value of u is
% found using finite difference methods that solve the linear advection
% equation (du/dt + F*du/dx = 0).

% We could make F more complicated to make it more fun?
% Right now I'm just using 1.

% Finite differences just means we assume:
% du/dt = (unew - u)/deltat and
% dx/dt = (u(p+1)-u(p-1))/2*deltax for this centrally spaced scheme
% then we just use algebra to solve for unew given
% (unew - u)/deltat = -(u(p+1)-u(p-1))/2*deltax
% That is how the "First Order Upwind Scheme" was derived, we believe;
% mostly it is the scheme we found in a textbook detailing these sorts of
% systems that seemed possible to implement here.

% courant_num is the "Courant number" and it factors in deltat, deltax, and the wave
% speed.

% Functionality is broken out into functions for two reasons:
    % Hoping for faster performance for large num_spaces
    % Desired practice doing this in Matlab, as it is generally considered
    % best practice in many programming languages

for time = 1 : time_increments
   
    % Update the heatmap_video with the latest changes
    update_video_heatmap(heatmap_video, u, max_temperature);
    
    % Update the graph_video with the latest changes
%     update_video_graph(graph_video, u, x, max_temperature);

    % Evolve the graph continually as the shock propagates
    u = first_order_upwind(u, courant_num);

    % Account for some dissipation of the heat wave as it travels
    u = smooth_elements(u, to_average);
     
end

% Close the video file
close(heatmap_video);

% Close the graph video file
% close(graph_video);

% Reports how long execution took
toc

