function move_angle = get_sagittal_angle(virtual_leg,body_R, body_vy, planner)

    distance = body_vy* planner.y_Ts/2 + planner.y_Kv*(0-body_vy);  

    if distance > 0.5*norm(virtual_leg)
        distance = 0.5*norm(virtual_leg);
    elseif distance < -0.5*norm(virtual_leg)
        distance = -0.5*norm(virtual_leg);
    end
    
    move_angle = asin(distance/norm(virtual_leg));
    if move_angle > 20/180*pi
        move_angle = 20/180*pi;
    elseif move_angle < -20/180*pi
        move_angle = -20/180*pi;
    end
    
end