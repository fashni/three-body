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
            [self.num_of_pos, ~] = size(pos);
            [self.num_of_vel, ~] = size(vel);
            self.name = name;
        end
        
        function append(self, pos, vel)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            [p, ~] = size(pos);
            [v, ~] = size(vel);
            self.positions = cat(1, self.positions, pos);
            self.velocities = cat(1, self.velocities, vel);
            self.num_of_pos = self.num_of_pos + p;
            self.num_of_vel = self.num_of_vel + v;
        end
        
        function outputArg = get_min(self, prop, axis)
            min_val = zeros(1,self.num_of_pos);
            if prop == "vel"
                for idx = 1:self.num_of_vel
                    if axis == 'x'
                        min_val(idx) = self.velocities(idx, 1);
                    elseif axis == 'y'
                        min_val(idx) = self.velocities(idx, 2);
                    elseif axis == 'z'
                        min_val(idx) = self.velocities(idx, 3);
                    end
                end
            elseif prop == "pos"
                for idx = 1:self.num_of_pos
                    if axis == 'x'
                        min_val(idx) = self.positions(idx, 1);
                    elseif axis == 'y'
                        min_val(idx) = self.positions(idx, 2);
                    elseif axis == 'z'
                        min_val(idx) = self.positions(idx, 3);
                    end
                end
            end
            outputArg = min(min_val);
        end
        
        function outputArg = get_max(self, prop, axis)
            max_val = zeros(1,self.num_of_pos);
            if prop == "vel"
                for idx = 1:self.num_of_vel
                    if axis == 'x'
                        max_val(idx) = self.velocities(idx, 1);
                    elseif axis == 'y'
                        max_val(idx) = self.velocities(idx, 2);
                    elseif axis == 'z'
                        max_val(idx) = self.velocities(idx, 3);
                    end
                end
            elseif prop == "pos"
                for idx = 1:self.num_of_pos
                    if axis == 'x'
                        max_val(idx) = self.positions(idx, 1);
                    elseif axis == 'y'
                        max_val(idx) = self.positions(idx, 2);
                    elseif axis == 'z'
                        max_val(idx) = self.positions(idx, 3);
                    end
                end
            end
            outputArg = max(max_val);
        end

        function pos_scale(self, scaling_factor)
            self.positions = scaling_factor * self.positions;
        end

        function vel_scale(self, scaling_factor)
            self.velocities = scaling_factor * self.velocities;
        end
    end
end

