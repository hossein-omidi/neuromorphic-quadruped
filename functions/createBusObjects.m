% Run AFTER your own init script
bodyBusInfo    = Simulink.Bus.createObject(body);
plannerBusInfo = Simulink.Bus.createObject(planner);

% The calls above create bus objects in base workspace with auto names.
% Normalize them to fixed names so you can reference them from the chart:
BodyBus    = eval(bodyBusInfo.busName);    %#ok<EVAL>
PlannerBus = eval(plannerBusInfo.busName); %#ok<EVAL>
assignin('base','BodyBus',BodyBus);
assignin('base','PlannerBus',PlannerBus);

% Controller base Ts (only if you want a single place to reference it)
controllerTs = 0.0025;
assignin('base','controllerTs',controllerTs);
