function [F] = fundamental(p)
    %p of the form [u' v' u v] n x 4 matrix. u' v' is right image
    %                  :
    %              [         ]

    n = size(p,1); % number of corresponding points
    A = zeros(n, 9); 
    for i = 1:n
        A(i,:) = [p(i,1)*p(i,3), p(i,1)*p(i,4), p(i,1), p(i,2)*p(i,3), p(i,2)*p(i,4), p(i,2), p(i,3), p(i,4), 1];
    end
    
    F0 = null(A);  %not quite sure why this has size 9x2
    [U,S,V] = svd(A);
    F1 = V(:,size(A,2));

    F = reshape(F1, 3,3)';

end