classdef Location_History < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x
        y
        z
        name
    end
    
    methods
        function self = Location_History(x, y, z, name)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            self.x = x;
            self.y = y;
            self.z = z;
            self.name = name;
        end
        
        function append(self, points)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            pos = num2cell(points.vectorize());
            [X,Y,Z] = deal(pos{:});
            self.x = [self.x X];
            self.y = [self.y Y];
            self.z = [self.z Z];
        end
        
        function outputArg = getaxis(self, axis)
            if axis == 'x'
                outputArg = self.x;
            elseif axis == 'y'
                outputArg = self.y;
            elseif axis == 'z'
                outputArg = self.z;
            end
        end
    end
end

