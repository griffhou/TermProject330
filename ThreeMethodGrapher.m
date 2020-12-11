
% Used to keep track of time of execution
tic

%Other methods aren't working...
%choice = input("1 -- First Order Upwind 2 -- LaxFriedrich 3 -- LaxWend  ");
%2D animated graph

%graph_video = VideoWriter('graph_video_2.avi');
%open(graph_video);

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
unew = zeros(num_spaces, 1);

% Set initial conditions, which will propogate in time.
% Can be changed and set as desired.
init_cond=0;
if init_cond == 0 
    for i = 1 : num_spaces    %%potentially one too few
            if x(i) < 0.3 && x(i) > 0.1
                % u(i) = 2*x(i)+2;
                u(i) = 20;
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
    clf
   
    unew(1) = u(1);
    %if choice==1
    % Evolve the graph continually as the shock propagates
        unew = first_order_upwind(unew, u, courant_num);
    
       
    %elseif choice==2
    %    unew = lax_friedrich(unew, u, courant_num);
    %elseif choice==3
    %    unew = lax_wendroff(unew, u, courant_num);
    %end

    % Account for some dissipation of the heat wave as it travels
    % unew = smooth_elements(unew, to_average);
    
    % Update the graph_video with the latest changes
    
    %%% No video for now
    %update_video_graph(graph_video, unew, x, max_temperature);
    
    % Swap pointers
    % Doing it like this rather than having just one array reduces
    % dispersion error
    plot(x,unew)
    [u,unew]=deal(unew,u);
    drawnow
     
end

% Close the graph video file
%%% No video for now
%close(graph_video);

% Reports how long execution took
toc