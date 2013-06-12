function [ ERnewLeft, ERnewRight ] = newEstimativeRegion( ERoldLeft, ERoldRight , mobileSensorLocation, r )
%funtion to calculate the new estimative region using the Estimative region
%and the range constraint of the mobile sensor

[row, column] = size(ERoldRight);

ERnewLeft  = zeros(row , column);
ERnewRight = zeros(row , column);
xm = mobileSensorLocation(1,1);
ym = mobileSensorLocation(1,2);
RangeConstraint = [(xm - r) (ym + r); (xm +r) (ym - r)];
RangeConstraint = limitingValues(RangeConstraint);

for i = 1:1:row
    
    x1 = ERoldLeft(i,1);
    y1 = ERoldLeft(i,2);
    
    x2 = ERoldRight(i,1);
    y2 = ERoldRight(i,2);
    
    x3 = RangeConstraint(1,1);
    y3 = RangeConstraint(1,2);
    
    x4 = RangeConstraint(2,1);
    y4 = RangeConstraint(2,2);
    
%     x5 = ERnewLeft(i,1);
%     y5 = ERnewLeft(i,2);
%     
%     x6 = ERnewRight(i,1);
%     y6 = ERnewRight(i,2);
    
       %((x1 <= x3) && (x3 <= x2)) && ((y2 <= y3) && (y3 <= y1))
       
    if(((x1 <= x3) && (x3 <= x2)) && ((y2 <= y3) && (y3 <= y1)))
        ERnewLeft(i,1) = x3;
        ERnewLeft(i,2) = y3;
    else
        ERnewLeft(i,1) = x1;
        ERnewLeft(i,2) = y1;
    end
    
    
    if(((x1 <= x4) && (x4 <= x2)) && ((y2 <= y4) && (y4 <= y1)))
        ERnewRight(i,1) = x4;
        ERnewRight(i,2) = y4;
    else
        ERnewRight(i,1) = x2;
        ERnewRight(i,2) = y2;        
    end
%     
% ERnewLeft(i,1) = x5;
% ERnewLeft(i,2) = y5;
% ERnewRight(i,1) = x6;
% ERnewRight(i,2) = y6;

%     
%        if (RangeConstraint(1,1) < ERoldLeft(i,1))
%            ERnewLeft(i,1) = ERoldLeft(i,1);
%        else if ((ERoldLeft(i,1) <= RangeConstraint(1,1))&& (RangeConstraint(1,1) <= ERoldRight(i,1)))
%                ERnewLeft(i,1) = RangeConstraint(1,1);
% 
%            else if(RangeConstraint(1,1) > ERoldRight(i,1))
%                    ERnewLeft(i,1) = ERoldLeft(i,1);
%                end
%            end
%        end       
%     
%        
%        if (RangeConstraint(2,1) < ERoldLeft(i,1))
%            ERnewRight(i,1) = ERoldRight(i,1);
%        else if ((ERoldLeft(i,1) <= RangeConstraint(2,1))&& (RangeConstraint(2,1) <= ERoldRight(i,1)))
%                ERnewRight(i,1) = RangeConstraint(1,1);
% 
%            else if(RangeConstraint(2,1) > ERoldRight(i,1))
%                    ERnewRight(i,1) = ERoldRight(i,1);
%                end
%            end
%        end 
% 
%        
%        if (RangeConstraint(1,2) > ERoldLeft(i,2))
%            ERnewLeft(i,2) = ERoldLeft(i,2);
%        else if ((ERoldRight(i,2) <= RangeConstraint(1,2)) && (RangeConstraint(1,2) <= ERoldLeft(i,2)))
%                ERnewLeft(i,2) = RangeConstraint(1,2);
% 
%            else if(RangeConstraint(1,2) < ERoldRight(i,2))
%                    ERnewLeft(i,2) = ERoldLeft(i,2);
%                end
%            end
%        end 
%        
%        if (RangeConstraint(2,2) > ERoldLeft(i,2))
%            ERnewRight(i,2) = ERoldRight(i,2);
%        else if ((ERoldRight(i,2) <= RangeConstraint(2,2)) && (RangeConstraint(2,2) <= ERoldLeft(i,2)))
%                ERnewRight(i,2) = RangeConstraint(2,2);
% 
%            else if(RangeConstraint(2,2) < ERoldRight(i,2))
%                    ERnewRight(i,2) = ERoldRight(i,2);
%                end
%            end
%        end 
end




end

