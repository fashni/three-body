function [history, iteration] = calc_orbit(integrator, steps, est)
    if nargin == 1
        steps = 1000;
        est = 0;
    elseif nargin == 2
        est = 0;
    end
    
    body_location_hist = Location_History([], [], '');
    for idx=1:length(integrator.bodies)
        body_location_hist(idx) = Location_History([], [], integrator.bodies(idx).name);
    end

    tmp_p = zeros(steps, 3, length(integrator.bodies));
    tmp_v = zeros(steps, 3, length(integrator.bodies));
    
    f = waitbar(0, 'Please wait...', 'Name', 'Calculating Orbit...', ...
        'CreateCancelBtn', 'setappdata(gcbf,''canceling'',1);');
    setappdata(f,'canceling',0);
    if est
        set(f,'Position', [377.2500 245.9375 270 100]);
        tic
    end
    for step=1:steps
        if getappdata(f,'canceling')
            unzeros
            break
        end

        % trajectory calculation
        for idx = 1:length(body_location_hist)
            tmp_p(step, :, idx) = integrator.bodies(idx).location.vectorize();
            tmp_v(step, :, idx) = integrator.bodies(idx).velocity.vectorize();
        end
        integrator.compute_gravity_step();
        
        % time estimation
        if est
            elapsed = toc;
            remain = elapsed/(step/steps)-elapsed;
            msg = sprintf('Progress: %.2f %%\nTime left: %s\nTime elapsed: %s\nSpeed: %.2f iter/sec', ...
                (step/steps)*100, datestr(seconds(remain),'HH:MM:SS'), ...
                datestr(seconds(elapsed),'HH:MM:SS'), step/elapsed);
            waitbar(step/steps, f, msg);
        end
    end
    delete(f)

    function unzeros
        tmp_p(step:end, :, :) = [];
        tmp_v(step:end, :, :) = [];
        steps = step - 1;
    end

    for idx = 1:length(body_location_hist)
        body_location_hist(idx).append(tmp_p(:, :, idx), tmp_v(:, :, idx));
    end

    history = body_location_hist;
    iteration = steps;
end