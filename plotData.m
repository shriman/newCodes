function [ x,y ] = plotData( X,k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
row = size(X,3);
x = zeros(row,1);
y = zeros(row,1);
for i = 1:1:row
    x(i) = X(k,1,i);
    y(i) = X(k,2,i);
end

end

