%% Term Project

%2D animated graph

%Set 2D Grid
%Change Nx and Nt to go faster but less accurate or for a longer period of
%time
Nx=500; Nt=500; xMin=0; xMax=1; 
x= linspace(xMin,xMax,Nx);
C=0.7;
%We should eventually find C using a0*DeltaT/DeltaX but oh well. To be
%explained later...

%Pre-set arrays to speed it up
u = zeros(Nx,1);
unew = zeros(Nx,1);

%Set initial conditions, which will propogate in time
%I just chose these initial conditions randomly based on the graph that
%they would create. No math involved just random
init_cond=0;
if init_cond == 0 
    for i=1:Nx    %%potentially one too few
            if x(i) <0.3 & x(i) > 0.25
                u(i) = 1;
            else
                u(i) = 0;
            end
    end
end

%Plot the initial conditions 
plot(x,u)
hold on           %Evolve

%Basically u is the y values (ie the dependent variable). For each time t
%there is a u value for every x. Therefore at every t the new value of u is
%found using finite difference methods that solve the linear advection
%equation (du/dt + F*du/dx = 0).

%We could make F more complicated to make it more fun?
%Right now I'm just using 1.

%Finite differences just means we assume:
%du/dt = (unew - u)/deltat and
%dx/dt = (u(p+1)-u(p-1))/2*deltax for this centrally spaced scheme
%then we just use algebra to solve for unew given
%(unew - u)/deltat = -(u(p+1)-u(p-1))/2*deltax
%That's kinda how the "First Order Upwind Scheme" was derived I think. I
%honestly just found that scheme in a textbook so idk.

%C is the "Courant number" and it factors in deltat deltax and the wave
%speed

%uleft will be an array used to add some boundary conditions where it
%disperses slightly, kind of like a heat source type deal
for k =1:Nt/1.5 %Nt/1.5 just seemed to go long enough for me
    clf
    %In order to evolve the graph continually
    unew(1)=u(1);
    for p =2:Nx;    %First Order Upwind Scheme
        unew(p)=u(p)-C*(u(p)-u(p-1));
    end
    plot(x,unew)
    [u,unew]=deal(unew,u);  %Swap pointers with the deal func
    drawnow 
end

%Can we get it to reflect?

hold off