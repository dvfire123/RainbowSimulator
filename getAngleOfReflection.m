function reflectedAngle = getAngleOfReflection(x, y, slope)
    % Gets the angle of reflection using Law of Reflection
    % Angle in degrees
    % (x, y) on unit circle
    % slope is slope of incoming ray

    s1 = y/x; % slope of the normal
    s2 = slope; % slope of the incoming ray

    reflectedAngle = getAngleBetweenTwoSlopes(s1, s2);
end