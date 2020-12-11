function [video] = update_video_graph(video, data, x_values, max_temp)
% Update a given video of a simple plot as the wave progresses.
[X,Y]=meshgrid(x_values,x_values);
Z=repmat(data,1,200); %create X*Y size mesh from 
plot=surf(X,Y,Z)
set(plot,'LineStyle','none')
colorbar
view(125,45)
grid off
writeVideo(video, getframe(gcf));
end