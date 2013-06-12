function [ position, PRLeft, PRRight] = initialStaticNodeData( a, V_max)
%This function takes an integer as a input ie the no of static sensor nodes
%in the network and then generates their intial estimative regions.
% the top matrix contains the coordinates of left up point 
%The bottom matrix contains the coordinates of the right down point

% nodePosition = round((rand(a,2))*100);
nodePosition = 250*(ones(a,2));
nodePosition = limitingValues(nodePosition);
% sensorPositions_y = round((rand(a,1))*100);
% Rs1 = [(s1x - r) (s1y + r); (s1x +r) (s1y - r)];
% Rs1 = limitingValues(Rs1);

%here PR represents the probable region
[PRLeft,PRRight] = probableRegion(nodePosition,V_max);

position = nodePosition;

% top = leftTop;
% bottom = rightBottom;
end

