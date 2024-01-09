% sensor PVDF thickness profile mismatch
% obtained from Frederik's FIBs

% Data
left = [0.41 0.43 0.45];
mid = [0.52 0.49 0.41];
right = [0.44 0.407 0.5605];

% Calculate means
left_mean = mean(left);
mid_mean = mean(mid);
right_mean = mean(right);

% Create a horizontal bar plot (exchanging x and y axes)
figure;
barh([left, mid, right]);
hold on;

% Overlay dashed lines for means
%y = 1:3;
%plot([left_mean, mid_mean, right_mean], y, '--');

% Customize the plot
yticks([]);
yticklabels({});
xlabel(['Measured PVDF', newline, 'Layer Thickness (\mum)']);
%title('PVDF Layer Thickness');

line([0, 1.22], [3.5, 3.5], 'LineStyle', '--', 'Color', 'k');
line([0, 1.22], [6.5, 6.5], 'LineStyle', '--', 'Color', 'k');

% Add data labels on the left side of bars
labels = {'Left', 'Mid', 'Right'};
label_positions = [-0.1, -0.1, -0.1];
text(label_positions, [2 5 8], labels, 'HorizontalAlignment', 'center', 'Rotation',270);

% Add text showing mean and sigma on the right side
t1=text(0.45, 1, sprintf('Mean: %.2f\\mum\nSigma: %.2f\\mum', mean([left mid right]), std([left mid right])), 'HorizontalAlignment', 'left');

hold off;
micasplot

set(t1, 'FontSize', 13);

% Set the width and height of the figure (in pixels)
width = 300;    % Specify your desired width here
height = 400;   % Specify your desired height here
set(gcf, 'Position', [100, 100, width, height]);
saveas(gcf,['pvdf_thickness.fig'])
saveas(gcf,['pvdf_thickness.png'])