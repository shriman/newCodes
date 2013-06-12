function [ noOfNodes ] = noOfNodesListening( seedPos,ERLeft,ERRight,r )
%given then ER and seedPosition this function finds the no of nodes hearing
%the seed at that position.

row = size(ERLeft,1);
flag = zeros(row,1);
for i = 1:1:row
    [ERLeftNew,ERRightNew] = newEstimativeRegion(ERLeft,ERRight,seedPos,r);
    benefit = benefitCalculation(ERLeft,ERRight,ERLeftNew,ERRightNew);
    if(benefit > 0)
        flag(i) = 1;
    end
end
noOfNodes = sum(flag);

end

