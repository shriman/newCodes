function [ nodePosEstimated ] = nodeLocalization_1( ERLeft,ERRight )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
row = size(ERLeft,1);
nodePosEstimated = zeros(row,2);
nodePosEstimated(:,1) = (ERLeft(:,1) + ERRight(:,1))/2;
nodePosEstimated(:,2) = (ERLeft(:,2) + ERRight(:,2))/2;
end

