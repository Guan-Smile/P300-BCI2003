%% use module
% [trainedClassifier_KNN, validationAccuracy] = trainClassifier_KNNCUBIC(all_train)
% y_fit2 = trainedClassifier_KNN.predictFcn(X_train_2)';
% yfit = trainedModel_svM.predictFcn(X_train_2)';

%  yfit = trainedModel_all1.predictFcn(X_test_2)';

yfit = trainedModel_allknn.predictFcn(X_test_2)';%%%%%%%%%可以使用280 :allknnMOD_pos
% 
% yfit = trainedModel_allbigtree.predictFcn(X_test_2)';%%%%%%%%%可以使用163列 :

 
pos=find(yfit==1);
% 
% load('Z_test_all.mat')
% fin_pos=StimulusCode_test(pos)

load('Z_train_all.mat')
fin_pos=StimulusCode_train(pos)
