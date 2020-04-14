classdef Location_History < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        positions
        velocities
        num_of_pos
        num_of_vel
        name
    end
    
    methods
        function self = Location_History(pos, vel, name)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            self.positions = pos;
            self.velocities = vel;
            self.num_of_pos = length(pos);
            self.num_of_vel = length(vel);
            self.name = name;
        end
        
        function append(self, pos, vel)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            self.positions{end + 1} = pos;
            self.num_of_pos = length(self.positions);
            self.velocities{end + 1} = vel;
            self.num_of_vel = length(self.velocities);
        end
        
        function outputArg = get_min(self, prop, axis)
            min_val = [];
            if prop == "vel"
                for idx = 1:self.num_of_vel
                    if axis == 'x'
                        min_val = [min_val self.velocities{idx}{1}];
                    elseif axis == 'y'
                        min_val = [min_val self.velocities{idx}{2}];
                    elseif axis == 'z'
                        min_val = [min_val self.velocities{idx}{3}];
                    end
                end
            elseif prop == "pos"
                for idx = 1:self.num_of_pos
                    if axis == 'x'
                        min_val = [min_val self.positions{idx}{1}];
                    elseif axis == 'y'
                        min_val = [min_val self.positions{idx}{2}];
                    elseif axis == 'z'
                        min_val = [min_val self.positions{idx}{3}];
                    end
                end
            end
            outputArg = min(min_val);
        end
        
        function outputArg = get_max(self, prop, axis)
            max_val = [];
            if prop == "vel"
                for idx = 1:self.num_of_vel
                    if axis == 'x'
                        max_val = [max_val self.velocities{idx}{1}];
                    elseif axis == 'y'
                        max_val = [max_val self.velocities{idx}{2}];
                    elseif axis == 'z'
                        max_val = [max_val self.velocities{idx}{3}];
                    end
                end
            elseif prop == "pos"
                for idx = 1:self.num_of_pos
                    if axis == 'x'
                        max_val = [max_val self.positions{idx}{1}];
                    elseif axis == 'y'
                        max_val = [max_val self.positions{idx}{2}];
                    elseif axis == 'z'
                        max_val = [max_val self.positions{idx}{3}];
                    end
                end
            end
            outputArg = max(max_val);
        end

%         function outputArg = getaxis(self, axis)
%             if axis == 'x'
%                 outputArg = self.x;
%             elseif axis == 'y'
%                 outputArg = self.y;
%             elseif axis == 'z'
%                 outputArg = self.z;
%             end
%         end
    end
end

