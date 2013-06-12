function [ ERLeft,ERRight ] = estimativeRegion( nodePosition,radioRange )
%This function calculates the initial estimative region of the nodes based
%on their new location.
r = radioRange;
x = nodePosition(:,1);
y = nodePosition(:,2);

ERLeft = [x - r, y - r];
ERRight = [x + r, y + r];

ERLeft = limitingValues(ERLeft);
ERRight = limitingValues(ERRight);

end

