function output = calc_orbit(integrator, steps, report_freq)
    if nargin == 1
        steps = 1000;
        report_freq = 10;
    elseif nargin == 2
        report_freq = 10;
    end
    
    body_location_hist = Location_History([], [], [], []);
    for i=1:length(integrator.bodies)
        body_location_hist(i) = Location_History([], [], [], integrator.bodies(i).name);
    end
    
    f = waitbar(0, '1', 'Name', 'Calculating Orbit...', ...
        'CreateCancelBtn', 'setappdata(gcbf,''canceling'',1); delete(gcbf)');
    set(f,'Position', [377.2500 245.9375 270 90]);
    setappdata(f,'canceling',0);
    start = clock;
    for i=1:steps
        if getappdata(f,'canceling')
            break
        end
        if mod(i-1, report_freq)==0
            for j=1:length(body_location_hist)
                body_location_hist(j).append(integrator.bodies(j).location);
            end
        end
        integrator.compute_gravity_step();
        
        stop = clock;
        elapsed = etime(stop, start);
        eta = elapsed/(i/steps);
        remain = eta-elapsed;
        msg = sprintf('Progress: %.2f %%\nTime left: %s\nTime elapsed: %s', ...
            (i/steps)*100, datestr(seconds(remain),'HH:MM:SS'), ...
            datestr(seconds(elapsed),'HH:MM:SS'));
        waitbar(i/steps, f, msg);
    end
    delete(f)
    output = body_location_hist;
end