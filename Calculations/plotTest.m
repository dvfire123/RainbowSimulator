% Plot test
clc;
close all;
clear;

%% Testing the plot of the laser light shone in a unit sphere
n1 = 1; % air
n2 = 1.33; % water
h = 0.87; % height laser raised above the central diameter

normalLineLength = 0.2;

% First line
startX = -2;
x1 = -sqrt(1 - h^2);
y1 = h;
[line1_x, line1_y] = getLineSeg2pts(startX, h, x1, y1);
[norm1_x, norm1_y] = getNormalLine(x1, y1, normalLineLength);

% Second line
incAngle1 = getIncidentAngle(0, h, x1 < 0);
refractedAngle1 = getAngleOfRefaction(incAngle1, n1, n2);
angle_2 = 90 - atand(-x1/y1) - refractedAngle1;
slope_2 = -tand(abs(angle_2));

% Get the point at the back of the sphere
[x_coord_back, y_coord_back] = solveIntersectionPt(slope_2, x1, y1);

% Equation of the second line
[line2_x, line2_y] = getLineSeg2pts(x1, y1, x_coord_back, y_coord_back);
[norm2_x, norm2_y] = getNormalLine(x_coord_back, y_coord_back, normalLineLength);

% Now onto the third line.
reflectedAngle = getAngleOfReflection(x_coord_back, y_coord_back, slope_2);
angleNormal_3 = atand(abs(y_coord_back/x_coord_back));
totAngle_3 = angleNormal_3 + reflectedAngle;
slope_3 = tand(abs(totAngle_3)); % Positive slope since it's reflected back

% Get the point at the front of the sphere
[x_coord_front, y_coord_front] = solveIntersectionPt(slope_3, x_coord_back, y_coord_back);
[norm3_x, norm3_y] = getNormalLine(x_coord_front, y_coord_front, normalLineLength);

% Equation of the third line
[line3_x, line3_y] = getLineSeg2pts(x_coord_back, y_coord_back, x_coord_front, y_coord_front);

% Finally the fourth line, where light refracts out of the sphere
incAngle2 = getIncidentAngle(slope_3, y_coord_front, x_coord_front < 0);
refractedAngle2 = getAngleOfRefaction(incAngle2, n2, n1); % Going from water to air this time
% As this normal can be vertical, we need to account for that
tol = 1e-5;
if abs(x_coord_front) < tol
    angleNormal_4 = 90;
else
    angleNormal_4 = atand(abs(y_coord_front/x_coord_front));
end

if y_coord_front/x_coord_front < 0
    slope_angle_4 = 180 - refractedAngle2 - angleNormal_4; % Think triangle
else
    slope_angle_4 = angleNormal_4 - refractedAngle2;
end
slope_4 = tand(abs(slope_angle_4));
[line4_x, line4_y] = getLineSegSlope1pt(x_coord_front, y_coord_front, startX, slope_4);

% Plot the meeting lines
x_meet = (h - y_coord_front)/slope_4 + x_coord_front;
y_meet = h;
[meet_line1_x, meet_line1_y] = getLineSeg2pts(x1, y1, x_meet, y_meet);
[meet_line2_x, meet_line2_y] = getLineSeg2pts(x_coord_front, y_coord_front, x_meet, y_meet);

%% Plot for now
figure;
viscircles([0, 0], 1);
hold on;
plot(line1_x, line1_y, 'LineWidth', 2);
plot(line2_x, line2_y, 'LineWidth', 2);
plot(line3_x, line3_y, 'LineWidth', 2);
plot(line4_x, line4_y, 'LineWidth', 2, 'Color', '#8040E6');
plot(norm1_x, norm1_y, '--', 'Color', "#77AC30", 'LineWidth', 1);
plot(norm2_x, norm2_y, '--', 'Color', "#77AC30", 'LineWidth', 1);
plot(norm3_x, norm3_y, '--', 'Color', "#77AC30", 'LineWidth', 1);
plot(meet_line1_x, meet_line1_y, '-.', 'LineWidth', 2);
plot(meet_line2_x, meet_line2_y, '-.', 'LineWidth', 2, 'Color', '#8040E6');
grid on;
ylim([-3, 1.5]);