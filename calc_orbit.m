function [history, iteration] = calc_orbit(integrator, steps)
    if nargin == 1
        steps = 1000;
    end
    
    body_location_hist = Location_History({}, {}, '');
    for idx=1:length(integrator.bodies)
        body_location_hist(idx) = Location_History({}, {}, integrator.bodies(idx).name);
    end
    
    f = waitbar(0, '1', 'Name', 'Calculating Orbit...', ...
        'CreateCancelBtn', 'setappdata(gcbf,''canceling'',1);');
    set(f,'Position', [377.2500 245.9375 270 100]);
    setappdata(f,'canceling',0);
    tic
    for step=1:steps
        if getappdata(f,'canceling')
            step = step-1;
            break
        end

        % trajectory calculation
        for idx = 1:length(body_location_hist)
            body_location_hist(idx).append(integrator.bodies(idx).location.to_cell(), integrator.bodies(idx).velocity.to_cell());
        end
        integrator.compute_gravity_step();
        
        % time estimation
        elapsed = toc;
        eta = elapsed/(step/steps);
        remain = eta-elapsed;
        msg = sprintf('Progress: %.2f %%\nTime left: %s\nTime elapsed: %s\nSpeed: %.2f iter/sec', ...
            (step/steps)*100, datestr(seconds(remain),'HH:MM:SS'), ...
            datestr(seconds(elapsed),'HH:MM:SS'), step/elapsed);
        waitbar(step/steps, f, msg);
    end
    delete(f)
    history = body_location_hist;
    iteration = step;
end