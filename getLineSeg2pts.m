function [lineSegx, lineSegy] = getLineSeg2pts(x0, y0, x1, y1)
    % Gets the line segment between (x0, y0) and (x1, y1)

    slope = (y1 - y0)/(x1 - x0);
    numSteps = 101;
    stepSize = abs(x0 - x1)/(numSteps - 1);

    lineSegx = linspace(x0, x1, numSteps);
    lineSegy = NaN(1, length(lineSegx));

    if x0 > x1
        sign = -1;
    else
        sign = 1;
    end

    for k = 1:length(lineSegx)
        lineSegy(k) = y0 + sign * (k - 1) * stepSize * slope;
    end

end