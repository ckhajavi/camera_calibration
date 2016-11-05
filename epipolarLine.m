% Using the calibration matrix for each image
%    find 8 correspoding points for each image image pair.  
%    Use [u,v,1] = M* [x,y,z,1]
% Then find the fundamental matrix, F. Solve pt*F*p2 = 0
        %pt = homogeneous point in right image, transposed
        %p2 = homogeneous point in left image
% Then the epiplolar line, l in one image can be found using this equation:
% l' = Ftranspose *p 
% so l' is the epipolar line in image im' and p is the corresponding point
% in the other image.  
% 3d mesh can be made by taking the difference in position of the 2 corresponding points.
%       Depth is inversely related to correspondance of two points.  


function [epi] = epipolarLine(F, p)
%@params = point to calculate
    p_homo = [p(1); p(2); 1]
    epi = F'* p_homo
    

end

