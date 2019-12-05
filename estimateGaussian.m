function [mu Covariance] = estimateGaussian(X) # X  is (m x n ) matrix where m = 307, n = 2
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1); # to find mu of all features 
Covariance = zeros(n, n); # to find sigma square of all features 

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%

mu = (sum(X)/m)'; # mu = n  x 1
  
XX = bsxfun(@minus,X,mu(:)');

Covariance = XX'*XX/(size(X,1)-1); # n x n matrix









% =============================================================


end
