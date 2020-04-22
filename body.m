classdef Body
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        mass
        location
        velocity
        name
    end
    
    methods
        function obj = Body(mass, location, velocity, name)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            if nargin==3
                name = '';
            end
            obj.name = name;
            obj.mass = mass;
            obj.velocity = velocity;
            obj.location = location;
        end
    end
end

