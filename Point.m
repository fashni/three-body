classdef Point < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    properties
        x
        y
        z
    end
    methods
        function obj = Point(varargin)
            if nargin == 3
                [x,y,z] = deal(varargin{:});
            elseif nargin == 2
                [x,y] = deal(varargin{:});
                z = nan;
            elseif nargin == 1
                xyz = num2cell(cell2mat(varargin));
                if length(xyz)==1
                    [y,z] = deal(nan);
                    x = cell2mat(xyz);
                else
                    [x,y,z] = deal(xyz{:});
                end
            else
                return
            end
            obj.x = x;
            obj.y = y;
            obj.z = z;
        end

        function outputArg = vectorize(self)
            outputArg = [self.x self.y self.z];
        end

        function outputArg = to_cell(self)
            outputArg = num2cell(self.vectorize());
        end

        function varargout = scale(self, scaling_factor)
            X = self.x .* scaling_factor;
            Y = self.y .* scaling_factor;
            Z = self.z .* scaling_factor;
            if nargout
                varargout{1} = Point(X, Y, Z);
            else
                self.x = X;
                self.y = Y;
                self.z = Z;
            end
        end
    end
end

