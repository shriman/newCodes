function [ seedPositionNew ] = nextSeedPosition( benefitGrid,seedPosition,seedPosX,seedPosY,noOfSeeds )
%now find the possible locations for each seed to move so that the path is
%most optimum and also consumes less energy.
%first we will try to do using GB/dist and then later some advanced
%optimization algo can be used.
%this will output a set of co-ordinate for each seed to move corresponding
%to seed no ie. the ith co-ordinate corresponds to the next position of
%the ith seed

[row,column,page] = size(benefitGrid);

%now calculate the GB/dist matrix
GBbyDist = zeros(row,column,page);

for k = 1:1:page
    for i = 1:1:row 
        for j = 1:1:column;
            seedPosNew = [seedPosX(i,j,k),seedPosY(i,j,k)]; % this is one of the 120 new possible positions of the seed
            seedPos =  seedPosition(k,:);
%             X = seedPosX(i,j,k) + j -1;
%             Y = seedPosY();
%             if((benefitGrid(i,j,k) == 0)|| ((seedPosNew(1,1) == seedPos(1,1)) && (seedPosNew(1,2) == seedPos(1,2))) || (seedPosNew(1,1) == 0) || (seedPosNew(1,2) == 0))
%                 GBbyDist(i,j,k) = 0; 
%             else
% %                 seedPos = [seedPosX(i,j,k),seedPosY(i,j,k)]; % this is one of the 120 new possible positions of the seed
% %                 seedPosition =  seedPositions(k,:);
% %                 dist1 = norm(seedPos - seedPosition);
%                 dist2 = sqrt((seedPosNew(1,1)- seedPos(1,1))^2+(seedPosNew(1,2)- seedPos(1,2))^2);
%                 GBbyDist(i,j,k) = benefitGrid(i,j,k)/dist2;
%             end
            dist2 = sqrt((seedPosNew(1,1)- seedPos(1,1))^2+(seedPosNew(1,2)- seedPos(1,2))^2);
            
            GBbyDist(i,j,k) = benefitGrid(i,j,k)/dist2;
            if(benefitGrid(i,j,k) == 0)
                GBbyDist(i,j,k) = 0;
            end
            if(dist2 == 0)
                GBbyDist(i,j,k) = 0;
            end
            if(seedPosX(i,j,k) == 0)
                GBbyDist(i,j,k) = 0;
            end
            if(seedPosY(i,j,k) == 0)
                GBbyDist(i,j,k) = 0;
            end
        end
    end
end
% round(GBbyDist);
% GB1 = GBbyDist(:,:,1);
% GB2 = GBbyDist(:,:,2);
% GB3 = GBbyDist(:,:,3);
% GB4 = GBbyDist(:,:,4);
threshold = 20;
seedPositionNew = zeros(noOfSeeds,2);
% seedPosNew = [];
%now we have to find the next seed position with the help of our GbbyDist
%maximization algo;
%so now each seedPosNew(i) correspond to the next seed position of the ith
%seed
%seedPosNew(1) = gridSelectionAfterThreshold(); 
for i = 1:1:page
    seedPos = seedPosition(i,:);
%     GB = benefitGrid(:,:,i);
    GB = GBbyDist(:,:,i);
    seedPosX_1 = seedPosX(:,:,i);
    seedPosY_1 = seedPosY(:,:,i);
    seedPositionNew(i,:) = gridSelectionAfterThreshold(GB,seedPos,seedPosX_1,seedPosY_1,threshold);
    seedPositionNew(i,:) = limitingValues(seedPositionNew(i,:));
end





% GBbyDist;
% data = zeros(1,1);
% for k = 1:1:page
%     for i = 1:1:row 
%         for j = 1:1:column;
%             if(GBbyDist(i,j,k) ~= 0)
%                 data = [data;GBbyDist(i,j,k)];
%             end
%         end
%     end
% end
%data;
%hist(data);



end

