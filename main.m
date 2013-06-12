% This is the main script file used to test all the function and to
% initialize the values.
tic; % to find the runtime of the program
clear;
close;
%nodes = sensors
%seeds = mobile sensors
% Rm = radioRangeSeedLocations;

net = 500;%assuming the network to be of dimension 100*100meters
%%% do not forget to change the value in limiting value function
%initial sensor position\
noOfSeeds = 10;
% xsInitial = [1;500;500;1];% the initial co-ordinates of the mobile anchor
% ysInitial = [1;1;500;500];

% xsInitial = [1;1;1;1];% the initial co-ordinates of the mobile anchor
% ysInitial = [1;1;1;1];

xsInitial = round(net*rand(noOfSeeds,1));
ysInitial = round(net*rand(noOfSeeds,1));

seedPosition = [xsInitial,ysInitial];

r  = 50; % radio range of each sensor
noOfNodes = 50;
threshold = 200;
V_max = 50;
%randomly generated sensor position at time t= 0, will be used as reference
%data for simulation and also gives the estimative region of the nodes
[nodePosition, PRLeft, PRRight] = initialStaticNodeData(noOfNodes , V_max);


T = 100;
error = zeros(T,1);
seedPosForPlot = zeros(noOfSeeds,2,T+1);
nodePosForPlot = zeros(noOfNodes,2,T); 
seedPosForPlot(:,:,1) = seedPosition;
nodePosForPlot(:,:,1) = nodePosition;
for t = 1:1:T
    t
    if(t == 1)
        nodePositionNew = newNodePosition(nodePosition,V_max);
        [ERLeft,ERRight] = estimativeRegion(nodePositionNew,V_max);
        seedPositionNew = seedPosition;
    end
    
    if(t ~= 1)
        nodePositionNew = newNodePosition(nodePosEstmtd,V_max);
        [ERLeft,ERRight] = estimativeRegion(nodePositionNew,V_max);
        seedPositionNew = seedPosNew;
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%use this when using the for max no of nodes listening 
    seedPosNew = maxNoOfNodesHearing(seedPositionNew,nodePositionNew,V_max,r,threshold);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use this section when using the BenefitBydist algorithms
%uncomment the belo two lines when using the benefitbyDist algo or only the
%benefit algo

%     [benefitGrid,seedPosX,seedPosY] = benefitGridCalculation(seedPositionNew,nodePositionNew,V_max,r);
% 
%     seedPosNew = nextSeedPosition(benefitGrid,seedPositionNew,seedPosX,seedPosY,noOfSeeds,threshold);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%do not use the belo two lines
%     seedPosNew;
%     GBbyDist = nextSeedPosition(benefitGrid,seedPosition ,seedPosX,seedPosY,noOfSeeds);
 
    [ERnewLeft, ERnewRight] = newEstimativeRegion(ERLeft,ERRight,seedPosNew(1,:),r);
    for i = 2:1:noOfSeeds
        [ERnewLeft,ERnewRight] = newEstimativeRegion(ERnewLeft,ERnewRight,seedPosNew(i,:),r);
    end
    nodePosEstmtd = nodeLocalization(ERnewLeft,ERnewRight);
    error(t) = nodeEstimationError(nodePositionNew,nodePosEstmtd);
    seedPosForPlot(:,:,t+1) = seedPosNew;
    nodePosForPlot(:,:,t+1) = nodePositionNew;
end
meanError = sum(error)/t;
meanError = meanError/noOfNodes;
figure; plot(error);

x0 = zeros(T+1,2);
y0 = zeros(T+1,2);
for i = 1:1:T+1
    x0(i) = seedPosForPlot(1,1,i);
    y0(i) = seedPosForPlot(1,2,i);
end

figure; plot(x0,y0,'*');
hold on;
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%uncommet the code below  to plot the path for the first five nodes
% [x1,y1] = plotData(nodePosForPlot,1);
% plot(x1,y1);
% 
% [x2,y2] = plotData(nodePosForPlot,2);
% plot(x2,y2);
% 
% [x3,y3] = plotData(nodePosForPlot,3);
% plot(x3,y3);
% 
% [x4,y4] = plotData(nodePosForPlot,4);
% plot(x4,y4);
% 
% [x5,y5] = plotData(nodePosForPlot,5);
% plot(x5,y5);
% figure; plot(seedPosForPlot(1,1,:),seedPosForPlot(1,2,:));
% figure; plot(nodePosForPlot(1,1,:),seedPosForPlot(1,2,:));






toc;