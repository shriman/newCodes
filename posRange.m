function [posLeft, posRight] = posRange(posX,posY,V_max)
    posLeft(:,1) = posX - V_max;
    posLeft(:,2) = posY - V_max;
    posRight(:,1) = posX + V_max;
    posRight(:,2) = posY + V_max;
    posLeft = limitingValues(posLeft);
    posRight = limitingValues(posRight);
end
