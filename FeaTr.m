function [ out ] = FeaTr( in, n )
%FEATR Summary of this function goes here
%   Detailed explanation goes here
    if nargin<2
        n = size(in,1)*size(in,2); % assuming "in" is a vector
    end
    for i=1:n,
        if mod(i,2)==1,
            in(i) = sin(in(i))^2;
        else
            in(i) = cos(in(i))^2;
        end
    end
    out = in;
end

