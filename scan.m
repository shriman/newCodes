function [ seedPosNew,dir1,dir0 ] = scan( seedPosOld,dir1,dir0,V_max,r,net )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
row = size(seedPosOld,1); % now we have found the no of nodes
seedPosNew = zeros(row,2);
for i = 1:1:row
    x1 = seedPosOld(i,1);
    y1 = seedPosOld(i,2);
%     x0 = seedPosPrev(i,1);
%     y0 = seedPosPrev(i,2);
    d0 = dir0(i,1); 
    d1 = dir1(i,1);
    
    %
%     if(x0 == x1)
%         if((y1 - y0) > 0)
%             dir = 1; %motion is upward
%         else
%             dir = 2; % motion is downward
%         end
%     elseif( y0 == y1)
%         if((x1 - x0) > 0)
%             dir = 3; %motion is towards right
%         else
%             dir = 4; %motion is towards left 
%         end        
%     end
    
    add = 1 + round(rand(1)*V_max);
    x2 = x1;
    y2 = y1;
    
    if(x1 - r <= 0)
        if(y1 - r <= 0)
            if(d1 == 2)
                x2 = x1 + add;
                d0 = d1;
                d1 = 3;
            elseif(d1 == 4)
                y2 = y1 + add;
                d0 = d1;
                d1 = 1;
            elseif((d0 == 0) && (d1 == 0))
                %x2 = x1 + add;
                y2 = y1 + add;
                d0 = 4;
                d1 = 1;
            end
        elseif( y1 + r >= net)
            if(d1 == 1)
                x2 = x1 + add;
                d0 = d1;
                d1 = 3;
            elseif(d1 == 4)
                y2 = y1 - add;
                d0 = d1;
                d1 = 2;
            elseif((d0 == 0) && (d1 == 0))
                y2 = y1 - add;
                d0 = 4;
                d1 = 2;
            end
        else if(d1 == 1)
                y2 = y1 + add;
            elseif(d1 == 2)
                y2 = y1 - add;
            elseif((d0 == 0) && (d1 == 0))
                y2 = y1 + add;
                d0 = 4;
                d1 = 1;
            end
        end
        
    elseif(x1 + r >= net)
        if( y1 - r <= 0)
            if(d1 == 2)
                x2 = x1 - add;
                d0 = d1;
                d1 = 4;
            elseif(d1 == 3)
                y2 = y1 + add;
                d0 = d1;
                d1 = 1;
            elseif((d1 == 0) && (d0 == 0))
                y2 = y1 + add;
                d0 = 3;
                d1 = 1;
            end
        elseif( y1 + r >= net)
            if(d1 == 1)
                x2 = x1 - add;
                d0 = d1;
                d1 = 4;
            elseif(d1 == 3)
                y2 = y1 - add;
                d0 = d1;
                d1 = 2;
            elseif((d1 == 0) && (d0 == 0))
                y2 = y1 - add;
                d0 = 3;
                d1 = 2;
            end
        else if(d1 == 1)
                y2 = y1 + add;
            elseif(d1 == 2)
                y2 = y1 - add;
            elseif((d1 == 0) && (d0 == 0))
                y2 = y1 + add;
                d0 = 3;
                d1 = 1;
            end
        end
    else
        if(y1 + r >= net)
            if(d0 == 4)
                x2 = x1 - add;
                d0 = d1;
                d1 = 4;
            elseif(d0 == 3)
                x2 = x1 + add;
                d0 = d1;
                d1 = 3;
            elseif(d1 == 3)
                y2 = y1 - add;
                d0 = 3;
                d1 = 2;
            elseif(d1 == 4)
                y2 = y1 - add;
                d0 = 4;
                d1 = 2;
            elseif((d1 == 0) && (d0 == 0))
                y2 = y1 - add;
                d0 = 3;
                d1 = 2;
            end
        elseif(y1 - r <= 0)
            if(d0 == 4)
                x2 = x1 - add;
                d0 = d1;
                d1 = 4;
            elseif(d0 == 3)
                x2 = x1 + add;
                d0 = d1;
                d1 = 3;
            elseif(d1 == 3)
                y2 = y1 + add;
                d0 = d1;
                d1 = 1;
            elseif(d1 == 4)
                y2 = y1 + add;
                d0 = d1;
                d1 = 1;
            elseif((d1 == 0) && (d0 == 0))
                y2 = y1 + add;
                d0 = 3;
                d1 = 1;
            end
        else
            if(d1 == 1)
                y2 = y1 + add;
            elseif(d1 == 2)
                y2 = y1 - add;
            elseif((d1 == 0) && (d0 == 0))
                y2 = y1 + add;
                d0 = 3;
                d1 = 1;
            end
        end
    end

    dir0(i,1) = d0;
    dir1(i,1) = d1;
    seedPosNew(i,1) = x2;
    seedPosNew(i,2) = y2;
end
end
