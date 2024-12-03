function [normX, normY] = getNormalLine(x, y, lineLength)
    % Gets the normal line through (x, y), where the point is on the unit
    % circle

    tol = 1e-5;
    if abs(x) < tol
        slope_angle = 90;
    else
        slope_angle = atan(y/x);
    end
    x_offset = cos(slope_angle) * lineLength;
    y_offset = sin(slope_angle) * lineLength;

    [line1_x, line1_y] = getLineSeg2pts(x - x_offset, y - y_offset, x, y);
    [line2_x, line2_y] = getLineSeg2pts(x + x_offset, y + y_offset, x, y);
    
    normX = [line1_x, line2_x];
    normY = [line1_y, line2_y];
end