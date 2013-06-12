function [ seedPosNew ] = maxNoOfNodesHearingThreshold( BG,listenNode,seedPos,seedPosX,seedPosY,threshold )
%this function setsa threshold and then find the point to which max no of
%nodes are listening and is above the thershold

[r, c, v] = find(BG > threshold);
size_r = size(r,1);

possibleSeedPosition = zeros(size_r,2);
nodesListening = zeros(size_r,1);

for j = 1:1:size_r
    x = seedPosX(r(j),c(j));
    y = seedPosY(r(j),c(j));
    possibleSeedPosition(j,:) = [x,y];
    nodesListening = listenNode(r(j),c(j));

end

r1 = find(nodesListening == max(nodesListening(:)));

size_r1 = size(r1,1);

if(size_r1 == 0);
    seedPosNew = [seedPos(1,2) + 25,seedPos(1,2) + 25];
else
    temp = sqrt((possibleSeedPosition(r1(1),1) - seedPos(1,1))^2 + (possibleSeedPosition(r1(1),2) - seedPos(1,2))^2);
    flag = 1;
    if(size_r1 >1)
        for j = 2:1:size_r1
            dist1 = sqrt((possibleSeedPosition(r1(j),1) - seedPos(1,1))^2 + (possibleSeedPosition(r1(j),2) - seedPos(1,2))^2);
            if(dist1 < temp)
                temp = dist1;
                flag = j;
            end
        end
    end
    seedPosNew = possibleSeedPosition(r1(flag),:);
    
end


end

