function angle = getIncidentAngle(slope_light, y_cord, isLeftSide)
    % Given a light ray with slope "slope_light" hitting a unit circle at
    % the specified y-coordinate "y_cord", get the incident angle of the
    % light ray at that point.

    % Assume unit circle has center at origin
    % isLeftSide = false: right side for x-coord, otherwise leftside

    if isLeftSide
        sign = -1;
    else
        sign = 1;
    end

    x_cord = sign * sqrt(1 - y_cord^2);
    slope_normal = y_cord/x_cord;
    
    angle = getAngleBetweenTwoSlopes(slope_normal, slope_light);
end
