function y_predict = predict(X,mu1,mu2,mu3, Covariance1, Covariance2, Covariance3 ),
  
  [m n] = size(X);
  y_predict = zeros(m,1);


  p1 =  (multivariateGaussian(X, mu1, Covariance1))'; # 1 x m matrix
  p2 =  (multivariateGaussian(X, mu2, Covariance2))';
  p3 =  (multivariateGaussian(X, mu3, Covariance3))';
  p = [p1; p2 ;p3];
  
  [max_p indices] = max(p);
   
  y_predict = indices'; # m x 1  
   
   
   
  
  

  
  
  
  
endfunction
