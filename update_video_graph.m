function [video] = update_video_graph(video, data, x_values, max_temp)
% Update a given video of a simple plot as the wave progresses.
plot(x_values, data);
ylim([0, max_temp]);
grid off
writeVideo(video, getframe(gcf));
end

