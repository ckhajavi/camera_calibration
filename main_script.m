%% CS211A - Visual Computing - HW3

clear ; close all; clc

%% Part 0. 3D Points from calibration pattern

% P contains the 4D homogeneous coordinates of all points in the 
% order provided in the calibration pattern
P = zeros(36,4);
P(1,:) = [0 0 0 1];
P(2,:) = [64 0 0 1];
P(3,:) = [64 64 0 1];
P(4,:) = [0 64 0 1];
P(5,:) = [0 0 19 1];
P(6,:) = [64 0 19 1];
P(7,:) = [64 64 19 1];
P(8,:) = [0 64 19 1];
P(9,:) = [0 0 29 1];
P(10,:) = [64 0 29 1];
P(11,:) = [64 64 29 1];
P(12,:) = [0 64 29 1];
P(13,:) = [16 16 29 1];
P(14,:) = [48 16 29 1];
P(15,:) = [48 48 29 1];
P(16,:) = [16 48 29 1];
P(17,:) = [16 16 48 1];
P(18,:) = [48 16 48 1];
P(19,:) = [48 48 48 1];
P(20,:) = [16 48 48 1];
P(21,:) = [0 48 29 1];
P(22,:) = [32 48 29 1];
P(23,:) = [32 80 29 1];
P(24,:) = [0 80 29 1];
P(25,:) = [0 48 48 1];
P(26,:) = [32 48 48 1];
P(27,:) = [32 80 48 1];
P(28,:) = [0 80 48 1];
P(29,:) = [0 48 48 1];
P(30,:) = [32 48 48 1];
P(31,:) = [32 80 48 1];
P(32,:) = [0 80 48 1];
P(33,:) = [0 48 67 1];
P(34,:) = [32 48 67 1];
P(35,:) = [32 80 67 1];
P(36,:) = [0 80 67 1];


%% Part 1. Camera Calibration Matrix

I1 = imread('data/DSCF4200.jpg');
C1 = calibration(I1, P([33 34 17 18 9 10],:));
%C1_eig = calibration_eig(I1, P([33 34 17 18 9 10],:));

%I2 = imread('data/DSCF4198.jpg');
%C2 = calibration(I2, P([1:3 5:7 9:11 13:15 17:19 29:31 33:35],:));







