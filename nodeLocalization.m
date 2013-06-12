function [ nodePosEstimated ] = nodeLocalization( ERLeft,ERRight )
%This function calculates the node location using the estimative region of
%the node
row = size(ERLeft,1);
nodePosEstimated = zeros(row,2);
%for now using the 100 random sampple method
for i = 1:1:row;
    x1 = ERLeft(i,1);
    y1 = ERLeft(i,2);
    x2 = ERRight(i,1);
    y2 = ERRight(i,2);
    deltaX = x2 - x1;
    deltaY = y2 - y1;
%     newX = PRLeft(:,1) + round(deltaX.*rand(row,1));
%     newY = PRLeft(:,2) + round(deltaY.*rand(row,1));
    X = x1 + round(deltaX.*rand(100,1));
    Y = y1 + round(deltaY.*rand(100,1));
    nodePosEstimated(i,1) = round(sum(X)/100); 
    nodePosEstimated(i,2) = round(sum(Y)/100);
end


end

