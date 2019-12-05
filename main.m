%% Initialization
clear ; close all; clc
# ++++++++++++Load wine dataset+++++++++++++
fprintf('Reading the data\n');
data = load('wine.data.txt');

# ++++++++++++First picking any two feature++++++++++++++
X = data(:, 2:3);
y = data(:,1);

# +++++++++Picking the features+++++++++++++
##X = data(:, 2:end);
##y = data(:,1);

# ++++++++++Training , Test set split++++++++++
[m,n] = size(X) ;
P = 0.80 ; # 80% training set, 20% test set.
idx = randperm(m);
# Training set
#Log is used as feature transform strategy.
X_train = log(X(idx(1:round(P*m)),:)); 
y_train = y(idx(1:round(P*m)),:);
# Test set
X_test = log(X(idx(round(P*m)+1:end),:));
y_test = y(idx(round(P*m)+1:end),:);

# ++++++++feature scaling+++++++++++
X_train = featureNormalize(X_train);
X_test = featureNormalize(X_test);
 
# +++++++++++++ploting data+++++++++++++++++
figure(1);
plot(X_train(:, 1), X_train(:, 2), 'bx');
xlabel('alcohol');
ylabel('Malic acid');

#+++++++++++++++Training the model ++++++++++++++=
# Find the indices that represent corresponding classes.
idx_train_class1 = find(y_train==1);
idx_train_class2 = find(y_train==2);
idx_train_class3 = find(y_train==3);


# we have three training set for each classes.
X_train_class1 = X_train(idx_train_class1,:);
X_train_class2 = X_train(idx_train_class2,:);
X_train_class3 = X_train(idx_train_class3,:);


# Training the data of different classes to find mu and Covariance matrix
[mu1 Covariance1] = estimateGaussian(X_train_class1);
[mu2 Covariance2] = estimateGaussian(X_train_class2);
[mu3 Covariance3] = estimateGaussian(X_train_class3);
# Note: contour plot will work only for 3D plot
plotGaussian(X_train_class2,mu2,Covariance2);
kbhit;
plotGaussian(X_train_class1,mu1,Covariance1);
kbhit;
plotGaussian(X_train_class3,mu3,Covariance3);
kbhit;
#Predict  
y_predict= predict(X_test,mu1,mu2,mu3, Covariance1, Covariance2, Covariance3 );

#+++++++++++Calculate test accuracy +++++++++++++
fprintf('Test Accuracy: %f\n', mean(double(y_predict == y_test)) * 100);


