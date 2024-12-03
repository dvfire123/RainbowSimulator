function [lineSegx, lineSegy] = getLineSegSlope1pt(x0, y0, x1, slope)
    % Gets the line segment between (x0, y0) and x1 with slope "slope"
    y1 = slope * (x1 - x0) + y0;
    [lineSegx, lineSegy] = getLineSeg2pts(x0, y0, x1, y1);
end