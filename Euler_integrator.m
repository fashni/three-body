classdef Euler_integrator < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        time_step
        bodies
    end
    
    methods
        function obj = Euler_integrator(time_step, bodies)
            %UNTITLED3 Construct an instance of this class
            %   Detailed explanation goes here
            obj.time_step = time_step;
            obj.bodies = bodies;
        end
        
        function outputArg = compute_single_body_acc(self, body_index)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            G_const = 6.6743e-11;
            % G_const = 66.743;
            acc = [0 0 0];
            target_body = self.bodies(body_index);
            target_loc = target_body.location.vectorize();
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
                    acc = acc + (tmp * (ext_loc - target_loc));
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
                % if index==3
                %     sprintf('target_body: %s\nmass: %.2f\nacc: [%.2f %.2f %.2f]\n\n', target_body.name, target_body.mass, acc(1), acc(2), acc(3))
                % end
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

