function angle = getAngleBetweenTwoSlopes(s1, s2)
    % Gets the angle between two slopes in degrees
    angle = atand(abs((s1 - s2)/(1 + s1*s2)));
end