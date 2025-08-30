function move_angle = get_move_angle(virtual_leg,body_vx, tgt_body_vx, planner)

    distance = body_vx* planner.Ts/2 + planner.Kv*(tgt_body_vx-body_vx);
    
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