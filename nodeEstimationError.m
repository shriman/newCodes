function [ totalError ] = nodeEstimationError( nodePositionNew,nodePositionEstimated )
%this function calculates the total estimation error of the algorithm
row = size(nodePositionNew,1);

error = zeros(row,1);

for i = 1:1:row
    x1 = nodePositionNew(i,1);
    y1 = nodePositionNew(i,2);
    x2 = nodePositionEstimated(i,1);
    y2 = nodePositionEstimated(i,2);
    error = sqrt((x1 - x2)^2 + (y1 - y2)^2);
end

totalError = sum(error);

end

