function plotGaussian(X, mu, Covariance),

x = -10:.1:10; %// x axis
y = -10:.1:10; %// y axis

[X1 X2] = meshgrid(x,y); %// all combinations of x, y
size([X1 X2])
Z = multivariateGaussian([X1(:) X2(:)],mu,Covariance); # X1(:) is colum vector
size(Z)
Z = reshape(Z,size(X1));
figure(2);
plot(X(:, 1), X(:, 2),'bx');
hold on;
#size of X must match number of columns in Z
% Do not plot if there are infinities
contour(X1,X2,Z,10);
hold off;
end