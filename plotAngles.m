clear;
clc;
close all;

%% Plot theta vs h
n = 1.33; % water
h = linspace(0.01, 0.99);
alphaAngle = NaN(1, length(h));

for k = 1:length(h)
    alphaAngle(k) = getAngle(h(k), n);
end

%% Plot Graph
plot(h, alphaAngle, 'LineWidth', 2);
grid on;
xlabel('h', 'FontSize', 14);
ylabel('\alpha (degrees)', 'FontSize', 14);

%% Save Data
save angleData.mat;