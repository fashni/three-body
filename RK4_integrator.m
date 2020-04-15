classdef RK4_integrator < handle
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        time_step
        bodies
    end
    
    methods
        function obj = RK4_integrator(time_step, bodies)
            %UNTITLED5 Construct an instance of this class
            %   Detailed explanation goes here
            obj.time_step = time_step;
            obj.bodies = bodies;
        end
        
        function outputArg = compute_single_body_acc(self, body_index)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            G_const = 6.6743e-11;
            % G_const = 66.743;
            target_body = self.bodies(body_index);
            target_loc = target_body.location.vectorize();
            target_vel = target_body.velocity.vectorize();
            
            acc = [0 0 0];
            if target_body.mass == 0
                outputArg = Point(acc);
                return
            end
            for index = 1:length(self.bodies)
                if index ~= body_index
                    external_body = self.bodies(index);
                    ext_loc = external_body.location.vectorize();
                    r = norm(target_loc - ext_loc);
                    tmp = (G_const*external_body.mass) / r^3;
                    
                    % k1
                    k1 = tmp * (ext_loc - target_loc);
                    
                    % k2
                    tmp_vel = partial_step(target_vel, k1, 0.5);
                    tmp_loc = partial_step(target_loc, tmp_vel, 0.5*self.time_step);
                    k2 = (ext_loc - tmp_loc) * tmp;
                    
                    % k3
                    tmp_vel = partial_step(target_vel, k2, 0.5);
                    tmp_loc = partial_step(target_loc, tmp_vel, 0.5 * self.time_step);
                    k3 = (ext_loc - tmp_loc) * tmp;
                    
                    % k4
                    tmp_vel = partial_step(target_vel, k3, 1);
                    tmp_loc = partial_step(target_loc, tmp_vel, self.time_step);
                    k4 = (ext_loc - tmp_loc) * tmp;
                    
                    acc = acc + (k1 + 2*k2 + 2*k3 + k4)/6;
                end
            end
            outputArg = Point(acc);
        end
        
        function update_location(self)
            for index=1:length(self.bodies)
                target_body = self.bodies(index);
                loc = target_body.location.vectorize() + (target_body.velocity.vectorize() * self.time_step);
                target_body.location = Point(loc);
                self.bodies(index) = target_body;
            end
        end
        
        function compute_velocity(self)
            for index=1:length(self.bodies)
                target_body = self.bodies(index);
                acc = self.compute_single_body_acc(index).vectorize();
                vel = target_body.velocity.vectorize() + (acc * self.time_step);
                target_body.velocity = Point(vel);
                self.bodies(index) = target_body;
            end
        end
        
        function compute_gravity_step(self)
            self.compute_velocity();
            self.update_location();
        end
    end
end

