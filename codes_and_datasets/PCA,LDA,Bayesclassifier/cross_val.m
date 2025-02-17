function err = cross_val(X_train, X_test)
 [~, prior] = prior_prob(X_train);
 [class_mean class_cov] = class_cond_prob(X_train);
 [S1 S2 S3] = class_cov_matrix(X_train);
 err = zeros(1,3); %stores the fraction of misclassification done for each of the three cases 
 
 for i = 1:size(X_test,1)
     [~, class] = max_prob(X_test(i,:), class_mean, S1,X_train); 
     if class ~= X_test(i,1);
         err(1) = err(1)+1; %counting misclassification when Sigma(i) = variance*I
     end
     [~, class] = max_prob(X_test(i,:), class_mean, S2,X_train);
     if class ~= X_test(i,1);
         err(2) = err(2)+1;%counting misclassification when Sigma(i) = Sigma
     end
     [~, class] = max_prob(X_test(i,:), class_mean, S3,X_train);
     if class ~= X_test(i,1);
         err(3) = err(3)+1;%counting misclassification when Sigma(i) = arbitrary
     end
 end
 err = err/size(X_test,1);
end
 
