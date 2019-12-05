function p = multivariateGaussian(X, mu, Covariance)
%MULTIVARIATEGAUSSIAN Computes the probability density function of the
%multivariate gaussian distribution.
%    p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2) Computes the probability 
%    density function of the examples X under the multivariate gaussian 
%    distribution with parameters mu and Sigma2. 

%    If Sigma2 is a matrix, it is
%    treated as the covariance matrix. 

%    If Sigma2 is a vector, it is treated
%    as the \sigma^2 values of the variances in each dimension (a diagonal
%    covariance matrix)
%
k = length(mu);
# bsxfun() function is convenient to  
#perform numeric calculation effiently.
XX = bsxfun(@minus, X, mu(:)');
p = (2 * pi) ^ (- k / 2) * det(Covariance) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, XX * pinv(Covariance), XX), 2)); # m x 1 matrix

end