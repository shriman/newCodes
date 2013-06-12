function [ nodePositionNew ] = newNodePosition( nodePositionOld,V_max )
%this function calculates the next position of sensor node where it will go
%based on its current location and the max speed velocity of travel

[PRLeft,PRRight] = probableRegion(nodePositionOld,V_max);

row = size(nodePositionOld,1);
deltaX = PRRight(:,1) - PRLeft(:,1); 
deltaY = PRRight(:,2) - PRLeft(:,2);


newX = PRLeft(:,1) + round(deltaX.*rand(row,1));
newY = PRLeft(:,2) + round(deltaY.*rand(row,1));

newX = limitingValues(newX);
newY = limitingValues(newY);

nodePositionNew = [newX,newY];

end

