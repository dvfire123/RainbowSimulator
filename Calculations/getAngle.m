function angle = getAngle(h, n)
    % Get Angle in terms of h
    n1 = 1; % Air
    n2 = n; % Any other material

    % First line
    x1 = -sqrt(1 - h^2);
    y1 = h;
    
    % Second line
    incAngle1 = getIncidentAngle(0, h, x1 < 0);
    refractedAngle1 = getAngleOfRefaction(incAngle1, n1, n2);
    angle_2 = 90 - atand(-x1/y1) - refractedAngle1;
    slope_2 = -tand(abs(angle_2));
    
    % Get the point at the back of the sphere
    [x_coord_back, y_coord_back] = solveIntersectionPt(slope_2, x1, y1);
    
    % Now onto the third line.
    reflectedAngle = getAngleOfReflection(x_coord_back, y_coord_back, slope_2);
    angleNormal_3 = atand(abs(y_coord_back/x_coord_back));
    totAngle_3 = angleNormal_3 + reflectedAngle;
    slope_3 = tand(abs(totAngle_3)); % Positive slope since it's reflected back
    
    % Get the point at the front of the sphere
    [x_coord_front, y_coord_front] = solveIntersectionPt(slope_3, x_coord_back, y_coord_back);
    
    % Finally the fourth line, where light refracts out of the sphere
    incAngle2 = getIncidentAngle(slope_3, y_coord_front, x_coord_front < 0);
    refractedAngle2 = getAngleOfRefaction(incAngle2, n2, n1); % Going from water to air this time
    angleNormal_4 = atand(abs(y_coord_front/x_coord_front));
    if y_coord_front/x_coord_front < 0
        slope_angle_4 = 180 - refractedAngle2 - angleNormal_4; % Think triangle
    else
        slope_angle_4 = angleNormal_4 - refractedAngle2;
    end

    angle = slope_angle_4;
end