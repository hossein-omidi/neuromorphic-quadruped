function initControllerParams()
    % This function aligns with your existing initialization script
    % and ensures compatibility with the Stateflow chart
    
    % Robot body parameters (from your initialization)
    body.x_length = 0.6;
    body.y_length = 0.3;
    body.z_length = 0.15;
    body.shoulder_size = 0.07;  
    body.upper_length = 0.16;
    body.lower_length = 0.25;
    body.foot_radius = 0.035;
    body.shoulder_distance = 0.2;
    body.max_stretch = body.upper_length + body.lower_length;
    body.knee_damping = 0.1;

    % Planner parameters (from your initialization)
    planner.touch_down_height = body.foot_radius;
    planner.stand_s = 0;
    planner.stand_u = 30*pi/180;
    planner.stand_k = -60*pi/180;
    
    % Calculate stand height using forward kinematics
    stance_pos = forward_kinematics(planner.stand_s, planner.stand_u, planner.stand_k, body);
    planner.stand_height = stance_pos(3);
    
    planner.flight_height = 1.1 * planner.stand_height;
    planner.time_circle = 3;
    planner.swing_ang = 12/180*pi;
    planner.init_shake_ang = 3/180*pi;
    planner.tgt_body_ang = 0;
    planner.tgt_body_vx = 0.3;
    planner.Ts = 0.1;
    planner.Kv = 0.3;
    planner.y_Ts = 0.21;
    planner.y_Kv = -0.34;
    planner.state0_vel_thres = 0.05;
    planner.state0_trans_thres = 300;
    planner.state0_swing_ang = 10*pi/180;
    planner.state0_swing_T = 1200;
    planner.state12_trans_speed = 0.2;
    planner.leg_swing_time = 70; % In samples (0.25s at 400Hz)
    
    % Calculate offsets (as in original controller)
    body.fl_offset = [body.shoulder_distance; body.y_length/2+body.shoulder_size/2; 0];
    body.fr_offset = [body.shoulder_distance; -body.y_length/2-body.shoulder_size/2; 0];
    body.rl_offset = [-body.shoulder_distance; body.y_length/2+body.shoulder_size/2; 0];
    body.rr_offset = [-body.shoulder_distance; -body.y_length/2-body.shoulder_size/2; 0];
    
    % Save to base workspace
    assignin('base', 'body', body);
    assignin('base', 'planner', planner);
    
    disp('Controller parameters initialized in base workspace');
end