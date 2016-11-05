function [R Q]=rq(A)

% This function computes the RQ decomposition of a matrix A, where R is
% upper triangular and Q is orthogonal

[m n]=size(A);
if m>n
    error('RQ: Number of rows must be smaller than column');
end

[Q R]=qr(flipud(A).');
R=flipud(R.');
R(:,1:m)=R(:,m:-1:1);
Q=Q.';
Q(1:m,:)=Q(m:-1:1,:);

end