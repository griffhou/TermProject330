function [video] = update_video_heatmap(video, data, max_temp)
% Take a video file and update it with the most recent frame based on the
% data
heatmap(data', 'Colormap', jet);
    % Remove the lines on the heatmap and set the axis
    Ax = gca;
    Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
    Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
    grid off
    caxis([0, max_temp]);
    writeVideo(video, getframe(gcf));
end

