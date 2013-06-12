function [ Matrix ] = limitingValues( inputMatrix)
%this function checks for the limiting values of the Estimative region and
%then corects the values according to the grid 

[row, column] = size(inputMatrix);

for i = 1:1:row
    for j = 1:1:column
        if (inputMatrix(i,j) <= 1)
            inputMatrix(i,j) = 1;
        
        else if (inputMatrix(i,j) >= 500)
               inputMatrix(i,j) = 500; 
            end
        end
    end
end   

Matrix = inputMatrix;
end