function [ seedPosNew1 ] = gridSelectionAfterThreshold( GBbyDist,seedPos,seedPosX,seedPosY,threshold )
%Uthis function takes input the GBbyDist Matrix for ith seedPosition and
%also takes input the location of ith seed and the coordinates of its
%probable region 
%now we will aplly a threshold and then find the co-ordinates of all the points
%which are above threshhold and will also store the benefitByDistance value
%corresponding to each point.

[r, c, v] = find(GBbyDist < threshold);
size_r = size(r,1);
    
possibleSeedPosition = zeros(size_r,2);
GBbyDistNew = zeros(size_r,1);

for i = 1:1:size_r
    x = seedPosX(r(i),c(i));
    y = seedPosY(r(i),c(i));
    possibleSeedPosition(i,:) = [x,y];
    GBbyDistNew(i) = GBbyDist(r(i),c(i));
end

% now since we have the co-ordinates of points wrt to GBbyDist and also we
% have the GBbyDist, so now we can sort the points in decreasing order of
% GBbyDist and then find the co-ordinated of the point which has maximum
% GBbyDist.

r1 = find(GBbyDistNew == max(GBbyDistNew(:)));


size_r1 = size(r1,1);

if(size_r1 == 0)
    seedPosNew1 = seedPos;
else
%     seedPosNew1 = possibleSeedPosition(r1(1),:);
    temp = sqrt((possibleSeedPosition(r1(1),1)- seedPos(1,1))^2+(possibleSeedPosition(r1(1),2)- seedPos(1,2))^2);
    flag = 1;
    if(size_r1 > 1)
        for i = 2:1:size_r1;
            dist1 = sqrt((possibleSeedPosition(r1(i),1)- seedPos(1,1))^2+(possibleSeedPosition(r1(i),2)- seedPos(1,2))^2);
            if(dist1 <= temp)
                temp = dist1;
                flag = i;
            end
        end
    end
    seedPosNew1 = possibleSeedPosition(r1(flag),:);
end



end

