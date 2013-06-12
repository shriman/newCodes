function [ benefitGrid,seedPosX,seedPosY ] = benefitGridCalculation( seedPosition, nodePosition, V_max ,r)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

noOfSeeds = size(seedPosition,1);
% % noOfNodes = size(nodePositions,1);
% to find the possible locations of the nodes
% seedPositionRangeLeft = zeros(noOfSeeds,2);
% seedPositionRangeRight = zeros(noOfSeeds,2);
% xs = zeros(noOfSeeds,1);
% ys = zeros(noOfSeeds,1);

% xs = xsInitial;
% ys = ysInitial;
%seedPositions = [xs,ys];

% xs = seedPosition(:,1);
% ys = seedPosition(:,2);
% 
% xn = nodePosition(:,1);
% yn = nodePosition(:,2);


[seedPositionRangeLeft, seedPositionRangeRight] = probableRegion(seedPosition,V_max);
[nodeERLeft, nodeERRight] = probableRegion(nodePosition,V_max);
%here nodePositionRange Left and Right are the Coordinates of the
%Estimative region of the node
nodeERoldLeft = nodeERLeft;
nodeERoldRight = nodeERRight;


page = noOfSeeds;
row = 2*V_max + 1;
column = 2*V_max + 1;

benefitGrid = zeros(row,column,page);
seedPosX = zeros(row,column,page);
seedPosY = zeros(row,column,page);
%now we need to clalculate the grid benefit corresponding to each possible
%location of the seed.
null = V_max +1;
for k = 1:1:page
    
    seedPosRangeLeft = seedPositionRangeLeft(k,:);
    seedPosRangeRight = seedPositionRangeRight(k,:);
    xnull_start = seedPosRangeRight(1,1) - seedPosRangeLeft(1,1) + 1;
    ynull_start = seedPosRangeRight(1,2) - seedPosRangeLeft(1,2) + 1;
%     seedPosX(i,j,k) = 0;
%     seedPosY(i,j,k) = 0;
    for i = 1:1:row
        
        for j = 1:1:column
            if( (i > xnull_start) || (j > ynull_start))
                benefitGrid(i,j,k) = benefitGrid(i,j,k) + 0;    %see ap age in note book for here coz here is a trick
                %it is on the page next after the discussion of 4th june
                seedPosX(i,j,k) = 0;
                seedPosY(i,j,k) = 0;
            else 
%                 nodeERnewLeft = nodeERoldLeft;
%                 nodeERnewRight = nodeERoldRight;
%                 seedPosX(i,j,k) = 0;
%                 seedPosY(i,j,k) = 0;
                seedPosX(i,j,k) = seedPosRangeLeft(1,1) + j -1;
                seedPosY(i,j,k) = seedPosRangeLeft(1,2) + i - 1;
                seedPos = [seedPosX(i,j,k),seedPosY(i,j,k)];
                %seedPos = seedPositions(k,:);  this is wrong
                oldArea = abs(((nodeERoldRight(:,1) - nodeERoldLeft(:,1))+1).*((nodeERoldRight(:,2) - nodeERoldLeft(:,2))+1));
                [nodeERnewLeft, nodeERnewRight] = newEstimativeRegion(nodeERoldLeft,nodeERoldRight,seedPos,r);
                newArea = abs(((nodeERnewRight(:,1) - nodeERnewLeft(:,1))+1).*((nodeERnewRight(:,2) - nodeERnewLeft(:,2))+1));
                benefit = abs(((oldArea - newArea).*newArea)./oldArea);
%                 benefitGrid(i,j,k) = benefitGrid(i,j,k) + sum(benefit);
                
                benefitGrid(i,j,k) = round(sum(benefit));
                if((i == null) && (j == null))
                    benefitGrid(i,j,k) = 0;
                end
            end
        end
        
        
    end
        
    
end



% seedPositionRangeLeft(:,1) = xs - V_max; 
% seedPositionRangeLeft(:,2) = ys + V_max;
% seedPositionRangeRight(:,1) = xs + V_max;
% seedPositionRangeRight(:,2) = ys + V_max;
% 
% seedPositionRangeLeft = limitingValues(seedPositionRangeLeft);
% seedPositionRangeRight = limitingValues(seedPositionRangeRight);






end

