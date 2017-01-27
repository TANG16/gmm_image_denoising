function [Xhat] = MVN_denoise(Y, mvn, noise)
% Denoises every column in y, assuming an MVN model and white noise.
% 
% The model assumes that y = x + noise where x is generated by a single
% 0-mean multi-variate normal distribution.
%
% Arguments
%  Y - A DxM matrix, whose every column corresponds to a patch in D
%      dimensions (typically D=64).
%  mvn - A struct with field:
%           cov - A DxD covariane matrix.
%  noise - the std of the noise in Y.
%

[D, ~] = size(Y);

gmm.means = zeros(1, D);
gmm.covs = mvn.cov;
gmm.mix = 1;

Xhat = GMM_denoise(Y, gmm, noise);