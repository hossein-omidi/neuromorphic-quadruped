

% Assumes spike1 is a logical timeseries in the workspace
ts = spike1;

% Build a uniform time vector with desired dt (e.g., 1/60 s for ~60 FPS)
t_start = ts.Time(1);
t_end   = ts.Time(end);
dt      = 1/120;                                % seconds per frame in the video
t_uniform = (t_start:dt:t_end).';

% Zero-order hold resample to uniform time
% (keeps spikes as steps; use 'linear' if you prefer linear interpolation)
tsu = resample(ts, t_uniform, 'zoh');          % still logical

t = tsu.Time(:);
y = double(tsu.Data(:));                       % cast to double for plotting

% Prepare video writer
v = VideoWriter('spike1_video.avi');           % or 'MPEG-4' on newer MATLABs
v.FrameRate = round(1/dt);                     % should match dt
open(v);

% Plot/animate and capture frames
fig = figure('Name','spike1 - Video render','Visible','off'); % hide for speed
ax = axes(fig);
h = plot(ax, t(1), y(1), 'LineWidth', 2);
xlim([t(1) t(end)]);
ylim([-0.1 1.1]);
xlabel('Time (s)'); ylabel('Value'); title('spike1 (uniform resampled)');

for k = 2:numel(t)
    set(h, 'XData', t(1:k), 'YData', y(1:k));
    drawnow;
    writeVideo(v, getframe(fig));
end
close(v);
close(fig);
disp('Saved video: spike1_video.avi');

