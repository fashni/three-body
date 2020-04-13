classdef Orbits
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        m
        r
        v
        iteration
        time_step
        rep_freq
        method
        history
    end
    
    methods
        function obj = Orbits(m, r, v, iter, step, rep, method, history)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.m = m;
            obj.r = r;
            obj.v = v;
            obj.iteration = iter;
            obj.time_step = step;
            obj.rep_freq = rep;
            obj.method = method;
            obj.history = history;
        end
    end
end

