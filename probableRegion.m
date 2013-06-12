function [left,right] = probableRegion( originalPosition,V_max)
%This function caclculates the probable region ie the rectangular region in which
% the sensor will be. the sensor will be at a point in this rectangular
% region after a unit time interval

%row = size(originalPosition,1);
x = originalPosition(:,1);
y = originalPosition(:,2);
%left = zeros(row,2);
%right = zeros(row,2);

left = [x - V_max, y - V_max];
right = [x + V_max,y + V_max];

left = limitingValues(left);
right = limitingValues(right);

end

