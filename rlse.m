function [x,xx] = rlse(A,b,p0)
% Provided rlse.m adapted to observations instead of random demo data.
% A: one observation per row; b: observed values; P0 = p0*I.
if nargin < 3
    p0 = 1000;
end
% Initialize state dimension and recursive least-squares storage
NA = size(A,2);
x = zeros(NA,1);
P = p0*eye(NA,NA);
% Preallocate history for each row-wise update
xx = zeros(NA,size(A,1));
for k = 1:size(A,1)
    [x,~,P] = rlse_online(A(k,:),b(k),x,P);
    xx(:,k) = x;
end
end
