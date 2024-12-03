function refractedAngle = getAngleOfRefaction(incidentAngle, n1, n2)
    % Gets the angle of refraction using Snell's Law
    % sin(incidentAngle)/sin(refractedAngle) = n2/n1
    % Angle in degrees

    refractedAngle = asind(sind(incidentAngle) * n1 / n2);
end