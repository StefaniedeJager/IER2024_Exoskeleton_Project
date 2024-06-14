%% read the excel file
filename = 'StepWidth_Day1vs5_2.xlsx'; 
data = readtable(filename);

% Create the boxplot
figure(1);
h = boxplot(data.StepWidth, data.Group, 'Colors', 'k', 'Symbol', '.');

% Customize the boxplot colors
% Get the handles of the different parts of the boxplot
boxes = findobj(h, 'Tag', 'Box');
medianLines = findobj(h, 'Tag', 'Median');
whiskers = findobj(h, 'Tag', 'Whisker');
outliers = findobj(h, 'Tag', 'Outliers');

% Define colors for each group
boxColors = ['r', 'g', 'b', 'r', 'g', 'b'];
outColors = ['k', 'k', 'k', 'k', 'k', 'k'];

% Set colors for the boxes
for j = 1:length(boxes)
    patch(get(boxes(j), 'XData'), get(boxes(j), 'YData'), boxColors(j), 'FaceAlpha', 0.5);
end

xlabel('Condition');
ylabel('Step Width');
%title('Boxplot of Step Width for different conditions on different training days');
hold on;

p12 = 2.79e-18;
p13 = 3.63e-60;
p23 = 1.83e-14;
p45 = 2.05e-2;
p46 = 3.99e-7;
p56 = 4.64e-3;

% p14 = ;
% p25 = ;
% p36 = ;

% Set significance levels
sig_levels = [0.05, 0.01, 0.001];
sig_labels = {'*', '**', '***'};

% Function to get significance label
getSigLabel = @(p) sig_labels{find(p < sig_levels, 1, 'last')};

% Determine y-position for significance markers
maxY = max(data.StepWidth);
yPos = maxY + 0.005; % adjust as needed

% Add significance markers
if p12 < sig_levels(1)
    plot([1 2], [yPos yPos], '-k', 'LineWidth', 1.5);
    text(1.5, yPos, getSigLabel(p12), 'HorizontalAlignment', 'center');
end

if p13 < sig_levels(1)
    plot([1 3], [yPos-0.01 yPos-0.01], '-k', 'LineWidth', 1.5);
    text(2, yPos-0.01, getSigLabel(p13), 'HorizontalAlignment', 'center');
end

if p23 < sig_levels(1)
    plot([2 3], [yPos-0.02 yPos-0.02], '-k', 'LineWidth', 1.5);
    text(2.5, yPos-0.02, getSigLabel(p23), 'HorizontalAlignment', 'center');
end

if p45 < sig_levels(1)
    plot([4 5], [yPos-0.03 yPos-0.03], '-k', 'LineWidth', 1.5);
    text(4.5, yPos-0.03, getSigLabel(p45), 'HorizontalAlignment', 'center');
end

if p46 < sig_levels(1)
    plot([4 6], [yPos-0.04 yPos-0.04], '-k', 'LineWidth', 1.5);
    text(5, yPos-0.04, getSigLabel(p46), 'HorizontalAlignment', 'center');
end

if p56 < sig_levels(1)
    plot([5 6], [yPos-0.05 yPos-0.05], '-k', 'LineWidth', 1.5);
    text(5.5, yPos-0.05, getSigLabel(p56), 'HorizontalAlignment', 'center');
end

hold off;
%% read the excel file
filename = 'StepLength_Day1vs5_2.xlsx'; 
data = readtable(filename);

% Create the boxplot
figure(2);
h = boxplot(data.StepLength, data.Group, 'Colors', 'k', 'Symbol', '.');

% Customize the boxplot colors
% Get the handles of the different parts of the boxplot
boxes = findobj(h, 'Tag', 'Box');
medianLines = findobj(h, 'Tag', 'Median');
whiskers = findobj(h, 'Tag', 'Whisker');
outliers = findobj(h, 'Tag', 'Outliers');

% Define colors for each group
boxColors = ['r', 'g', 'b', 'r', 'g', 'b'];
outColors = ['k', 'k', 'k', 'k', 'k', 'k'];

% Set colors for the boxes
for j = 1:length(boxes)
    patch(get(boxes(j), 'XData'), get(boxes(j), 'YData'), boxColors(j), 'FaceAlpha', 0.5);
end

xlabel('Condition');
ylabel('Step Length');
%title('Boxplot of Step Width for different conditions on different training days');
hold on;

p12 = 3.86e-80;
p13 = 7.89e-35;
p23 = 2.52e-11;
p45 = 2.15e-47;
p46 = 4.10e-44;
p56 = 5.65e-1;


% Set significance levels
sig_levels = [0.05, 0.01, 0.001];
sig_labels = {'*', '**', '***'};

% Function to get significance label
getSigLabel = @(p) sig_labels{find(p < sig_levels, 1, 'last')};

% Determine y-position for significance markers
maxY = max(data.StepLength);
yPos = maxY + 0.005; % adjust as needed

% Add significance markers
if p12 < sig_levels(1)
    plot([1 2], [yPos yPos], '-k', 'LineWidth', 1.5);
    text(1.5, yPos, getSigLabel(p12), 'HorizontalAlignment', 'center');
end

if p13 < sig_levels(1)
    plot([1 3], [yPos-0.05 yPos-0.05], '-k', 'LineWidth', 1.5);
    text(2, yPos-0.05, getSigLabel(p13), 'HorizontalAlignment', 'center');
end

if p23 < sig_levels(1)
    plot([2 3], [yPos-0.1 yPos-0.1], '-k', 'LineWidth', 1.5);
    text(2.5, yPos-0.1, getSigLabel(p23), 'HorizontalAlignment', 'center');
end

if p45 < sig_levels(1)
    plot([4 5], [yPos yPos], '-k', 'LineWidth', 1.5);
    text(4.5, yPos, getSigLabel(p45), 'HorizontalAlignment', 'center');
end

if p46 < sig_levels(1)
    plot([4 6], [yPos-0.05 yPos-0.05], '-k', 'LineWidth', 1.5);
    text(5, yPos-0.05, getSigLabel(p46), 'HorizontalAlignment', 'center');
end

if p56 < sig_levels(1)
    plot([5 6], [yPos-0.1 yPos-0.1], '-k', 'LineWidth', 1.5);
    text(5.5, yPos-0.1, getSigLabel(p56), 'HorizontalAlignment', 'center');
end

hold off;