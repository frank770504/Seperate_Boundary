clc
clear all

global span
global N
global Np
global weight

%=sampling?=%
is_sample = 1;
RandStream.setDefaultStream(RandStream('mt19937ar','seed',0));
%===========%

%=generate the weighting of f function =%
N = 2; %Space number
span = 5; %Range field
weight = span*(rand(N+1, 1) - 0.5);
%=======================================%

%=generate the point and label=%
Np = 400;%point number
points = span*(rand(Np, N) - 0.5);
points(:,N+1) = 1;
label = [];
for i=1:Np,
   label = [label; sign(weight'*FeaTr(points(i,:), 2)')];
end
points =[points label];
%==============================%

%=if need sample=%
if is_sample ==1,
    Nt = Np;
    Np = 100;%sample points
    test_set = points;
    poinst = [];
    ind_sample = round(rand(Np,1)*size(test_set,1) + 0.5);
    points = test_set(ind_sample', :);
end
%================&

%=plot the data set=%
figure
hold on
for i=1:Np,
    if points(i,4)>0,
        plot(points(i,1), points(i,2),'+');
    else
        plot(points(i,1), points(i,2), 'rx');
    end
end
hold off
%===================%
axis([-span/2 span/2 -span/2 span/2])
