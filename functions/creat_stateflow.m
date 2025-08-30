% Body bus definition
bodyBus = Simulink.Bus;
bodyBus.Elements(1) = Simulink.BusElement;
bodyBus.Elements(1).Name = 'shoulder_distance';
bodyBus.Elements(1).DataType = 'double';
bodyBus.Elements(2) = Simulink.BusElement;
bodyBus.Elements(2).Name = 'y_length';
bodyBus.Elements(2).DataType = 'double';
bodyBus.Elements(3) = Simulink.BusElement;
bodyBus.Elements(3).Name = 'shoulder_size';
bodyBus.Elements(3).DataType = 'double';
bodyBus.Elements(4) = Simulink.BusElement;
bodyBus.Elements(4).Name = 'max_stretch';
bodyBus.Elements(4).DataType = 'double';
assignin('base', 'Bus_body', bodyBus);

% Planner bus definition
plannerBus = Simulink.Bus;
plannerBus.Elements(1) = Simulink.BusElement;
plannerBus.Elements(1).Name = 'stand_height';
plannerBus.Elements(1).DataType = 'double';
plannerBus.Elements(2) = Simulink.BusElement;
plannerBus.Elements(2).Name = 'leg_swing_time';
plannerBus.Elements(2).DataType = 'double';
% Add all other planner parameters following same pattern...
assignin('base', 'Bus_planner', plannerBus);

% Default values
body_default = struct('shoulder_distance',0.20, 'y_length',0.30, ...
                      'shoulder_size',0.06, 'max_stretch',0.40);
planner_default = struct('stand_height',0.25, ...
                        'leg_swing_time',0.50/0.0025, ... % 200 ticks @ 400Hz
                        'tgt_body_vx',0.6, 'Kv',0.15, 'Ts',0.25, ...
                        'y_Kv',0.15, 'y_Ts',0.20, ...
                        'state0_vel_thres',0.02, 'state0_trans_thres',100, ...
                        'state0_swing_ang',5*pi/180, 'state0_swing_T',0.6/0.0025, ...
                        'state12_trans_speed',0.2);
assignin('base', 'body_default', body_default);
assignin('base', 'planner_default', planner_default);