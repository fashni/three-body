function [history, iteration] = calc_orbit(integrator, steps, report_freq)
    if nargin == 1
        steps = 1000;
        report_freq = 10;
    elseif nargin == 2
        report_freq = 10;
    end
    
    body_location_hist = Location_History([], [], [], []);
    for step=1:length(integrator.bodies)
        body_location_hist(step) = Location_History([], [], [], integrator.bodies(step).name);
    end
    
    f = waitbar(0, '1', 'Name', 'Calculating Orbit...', ...
        'CreateCancelBtn', 'setappdata(gcbf,''canceling'',1);');
    set(f,'Position', [377.2500 245.9375 270 90]);
    setappdata(f,'canceling',0);
    tic
    for step=1:steps
        if getappdata(f,'canceling')
            break
        end
        if mod(step-1, report_freq)==0
            for j=1:length(body_location_hist)
                body_location_hist(j).append(integrator.bodies(j).location);
            end
        end
        integrator.compute_gravity_step();
        
        elapsed = toc;
        eta = elapsed/(step/steps);
        remain = eta-elapsed;
        msg = sprintf('Progress: %.2f %%\nTime left: %s\nTime elapsed: %s', ...
            (step/steps)*100, datestr(seconds(remain),'HH:MM:SS'), ...
            datestr(seconds(elapsed),'HH:MM:SS'));
        waitbar(step/steps, f, msg);
    end
    delete(f)
    history = body_location_hist;
    iteration = step;
end