function [ seedPositionNew ] = maxNoOfNodesHearing( seedPosition,nodePosition,V_max,r,threshold )
%This function selects the points over a threshold for Gridbenefit and
%Selects the set of points for below a threshold and then find the point,
%among those selected point to which max no of nodes are listening and
%directs the anchor to traverse to that position


[BG, seedPositionX,seedPositionY] = benefitGridCalculation(seedPosition,nodePosition,V_max,r);
[nodeERLeft,nodeERRight] = probableRegion(nodePosition,V_max);

[row, column, page] = size(BG);
seedPositionNew = zeros(page,2);

listeningNodes = zeros(row, column, page);

for k = 1:1:page
    for i = 1:1:row
        for j = 1:1:column
            x = seedPositionX(i,j,k);
            y = seedPositionY(i,j,k);
            seedPos = [x,y];
            listeningNodes(i,j,k) = noOfNodesListening(seedPos,nodeERLeft,nodeERRight,r);
        end
    end
end

for i = 1:1:page
    seedPos = seedPosition(i,:);
    benefitGrid = BG(:,:,i);
    listenNode = listeningNodes(:,:,i);
    seedPositionX_1 = seedPositionX(:,:,i);
    seedPositionY_1 = seedPositionY(:,:,i);
    seedPositionNew(i,:) = maxNoOfNodesHearingThreshold(benefitGrid,listenNode,seedPos,seedPositionX_1,seedPositionY_1,threshold);
    seedPositionNew(i,:) = limitingValues(seedPositionNew(i,:));
end




end

