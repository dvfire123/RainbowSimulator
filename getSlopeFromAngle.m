function slope = getSlopeFromAngle(angle, otherSlope, isOtherSlopeLarger)
    % Gets the slope of the line given angle between it and the other
    % slope, and we need to specify if our slope or the other slope is
    % larger.

    % Angle in degrees
    gamma = tand(angle);
    m2 = otherSlope;
    syms m

    if isOtherSlopeLarger
        eqn = gamma == abs((m2 - m)/(1 + m*m2));
    else
        eqn = gamma == abs((m - m2)/(1 + m*m2));
    end

    S = solve(eqn, m);
    slope = double(S);
end