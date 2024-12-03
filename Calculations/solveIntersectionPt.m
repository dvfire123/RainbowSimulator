function [sol_xd, sol_yd] = solveIntersectionPt(slope, x1, y1)
    syms x y
    eqn1 = x^2 + y^2 == 1;
    eqn2 = (y - y1) == slope * (x - x1);

    [sol_x, sol_y] = solve(eqn1, eqn2);
    sol_x = double(sol_x);
    sol_y = double(sol_y);

    % We will have two solutions. Take the one that's different from x1 and
    % y1, respectively

    tolerance = 1e-3;
    for k = 1:length(sol_x)
        if abs(sol_x(k) - x1) > tolerance
            sol_xd = sol_x(k);
            break;
        end
    end

    for k = 1:length(sol_y)
        if abs(sol_y(k) - y1) > tolerance 
            sol_yd = sol_y(k);
            break;
        end
    end
end