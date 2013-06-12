function [ seedPosNew ] = scan( seedPosOld,dir1,dir0,V_max,r,net )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
row = size(seedPosOld,1); % now we have found the no of nodes

for i = 1:1:row
    x1 = seedPosOld(i,1);
    y1 = seedPosOld(i,2);
    x0 = seedPosPrev(i,1);
    y0 = seedPosPrev(i,2);
    dir0
    dir1
    %
    if(x0 == x1)
        if((y1 - y0) > 0)
            dir = 1; %motion is upward
        else
            dir = 2; % motion is downward
        end
    elseif( y0 == y1)
        if((x1 - x0) > 0)
            dir = 3; %motion is towards right
        else
            dir = 4; %motion is towards left 
        end        
    end
    
    add = 1 + round(rand(1)*V_max);
    x2 = x1;
    y2 = y1;
    
    if(x1 - r <= 0)
        if(y1 - r <= 0)
            if(dir == 2)
                x2 = x1 + add;
            elseif(dir == 4)
                y2 = y1 + add;
            end
        elseif( y1 + r >= net)
            if(dir == 1)
                x2 = x1 + add;
            elseif(dir == 4)
                y2 = y1 - add;
            end
        else if(dir == 1)
                y2 = y1 + add;
            elseif(dir == 2)
                y2 = y1 - add;
            end
        end
        
    elseif(x1 + r >= net)
        if( y1 - r <= 0)
            if(dir == 2)
                x2 = x1 - add;
            elseif(dir == 3)
                y2 = y1 + add;
            end
        elseif( y1 + r >= net)
            if(dir == 1)
                x2 = x1 - add;
            elseif(dir == 3)
                y2 = y1 - add;
            end
        else if(dir == 1)
                y2 = y1 + add;
            elseif(dir == 2)
                y2 = y1 - add;
            end
        end
    else
        if
        end
        
    end

    
    seedPosNew(i,1) = x2;
    seedPosNew(i,2) = y2;
end

