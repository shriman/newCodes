function [ benefit ] = benefitCalculation( ERoldLeft,ERoldRight, ERnewLeft, ERnewRight )
%function calculates the benifit by one node
% here benefit is an area ie a real quantity

% [row, column] = size(ERoldLeft);


 oldArea = abs(((ERoldRight(:,1) - ERoldLeft(:,1))+1).*((ERoldLeft(:,2) - ERoldRight(:,2))+1));

 newArea = abs(((ERnewRight(:,1) - ERnewLeft(:,1))+1).*((ERnewLeft(:,2) - ERnewRight(:,2))+1));
 
 benefit = oldArea - newArea;
 

end

