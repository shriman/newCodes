function [ ERnewLeft, ERnewRight ] = newEstimativeRegion( ERoldLeft, ERoldRight , seedPosition, r )
%funtion to calculate the new estimative region using the Estimative region
%and the range constraint of the mobile sensor

[row, column] = size(ERoldRight);

ERnewLeft  = zeros(row , column);
ERnewRight = zeros(row , column);
xm = seedPosition(1,1);
ym = seedPosition(1,2);
RangeConstraint = [(xm - r),(ym - r); (xm + r),(ym + r)];
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
    
   
    %%% now a new code
    c1x = (x1 + x2)/2;
    c1y = (y1 + y2)/2;
    c2x = (x3 + x4)/2;
    c2y = (y3 + y4)/2;
    
    cx = abs(c1x - c2x);
    cy = abs(c1y - c2y);
    
    L1 = abs(x2 - x1);
    L2 = abs(x4 - x3);
    
    H1 = abs(y2 - y1);
    H2 = abs(y4 - y3);
    
    %the condition (L1 + L2)/2 >= cx and (H1 + H2)/2 >= cy has to be
    %satisfied for the intersection to take place
    if(((L1 + L2)/2 >= cx ) && ((H1 + H2)/2 >= cy))
        L3 = abs((L1 + L2)/2 - cx);
        H3 = abs((H1 + H2)/2 - cy);
        if(c1x == c2x)
            c3x = c1x;
            L3 = min(L1,L2);
        else if(c1x > c2x)
                c3x = abs(c1x - (L1)/2 + (L3)/2);
            else
                c3x = abs(c1x + (L1)/2 - (L3)/2);                                      
            end
        end
        
        if(c1y == c2y)
            c3y = c1y;
            H3 = min(H1,H2);
        else if(c1y > c2y)
                c3y = abs(c1y - (H1)/2 + (H3)/2);
            else
                c3y = abs(c1y + (H1)/2 - (H3)/2);
            end
        end
        
        x5 = c3x - (L3)/2;
        y5 = c3y - (H3)/2;
        
        x6 = c3x + (L3)/2;
        y6 = c3y + (H3)/2;
    else
        x5 = x1;
        y5 = y1;
        x6 = x2;
        y6 = y2;
    end
    
    ERnewLeft(i,1) = x5;
    ERnewLeft(i,2) = y5;
    ERnewRight(i,1) = x6;
    ERnewRight(i,2) = y6;
    
    
    
    
       %((x1 <= x3) && (x3 <= x2)) && ((y2 <= y3) && (y3 <= y1))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % x5 = x1;
% % y5 = y1;
% % x6 = x2;
% % y6 = y2;
% % %case 1
% % if(((x1 <= x4) && (x4 <= x2)) && ((y1 <= y4) && (y4 <= y2)))
% %     x6 = x4;
% %     y6 = y4;
% % end
% % 
% % %case 2
% % if(((x1 <= x3) && (x3 <= x2)) && ((y1 <= y4) && (y4 <= y2)))
% %     x5 = x3;
% %     y6 = y4;
% % end
% % 
% % %case 3
% % if(((x1 <= x4) && (x4 <= x2)) && ((y1 <= y3) && (y3 <= y2)))
% %     x6 = x4;
% %     y5 = y3;
% % end
% % 
% % %case 4
% % if(((x1 <= x3) && (x3 <= x2)) && ((y1 <= y3) && (y3 <= y2)))
% %     x5 = x3;
% %     y5 = y3;
% % end
% %     
% % %case 5
% % if(((x1 <= x3) && (x3 <= x2)) && ((y3 < y1) && (y4 > y2)))
% %     x5 = x3;
% % end
% % 
% % %case 6
% % if(((x1 <= x4) && (x4 <= x2)) && ((y3 < y1) && (y4 > y2)))
% %     x6 = x4;
% % end
% % 
% % %case 7
% % if(((x3 < x1) && ( x4 > x2)) && ((y1 <= y3) && (y3 <= y2)))
% %     y5 = y3;
% % end
% %     
% % %case 8
% % if(((x3 < x1) && ( x4 > x2)) && ((y1 <= y4) && (y4 <= y2)))
% %     y6 = y4;
% % end
% %     
% % 
% % ERnewLeft(i,1) = x5;
% % ERnewLeft(i,2) = y5;
% % ERnewRight(i,1) = x6;
% % ERnewRight(i,2) = y6;
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
%     if(((x1 <= x3) && (x3 <= x2)) && ((y2 <= y3) && (y3 <= y1)))
%         ERnewLeft(i,1) = x3;
%         ERnewLeft(i,2) = y3;
%     else
%         ERnewLeft(i,1) = x1;
%         ERnewLeft(i,2) = y1;
%     end
%     
%     
%     if(((x1 <= x4) && (x4 <= x2)) && ((y2 <= y4) && (y4 <= y1)))
%         ERnewRight(i,1) = x4;
%         ERnewRight(i,2) = y4;
%     else
%         ERnewRight(i,1) = x2;
%         ERnewRight(i,2) = y2;        
%     end
    
end
