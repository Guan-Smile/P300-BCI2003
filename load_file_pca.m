clc
% clear
%% 
d=dir('*.mat');
prefix=('E:\BCI_IIdata\data\');

d.name
% for i=3:4   %%%%AAS010R01-05,,5,6 -11   
%    load([prefix,d(i).name]);
% end

load('X_train_S010.mat')
load('y_train_S010.mat')
Xy_1=load('X_train_all_y1.mat')%%%%导入只含y=1的x训练数据
yy_1=load('y_train_all_y1.mat')%%%导入只含y=1的y结果数据
Xy_0=load('X_train_all_y0.mat')%%%%导入只含y=1的x训练数据
yy_0=load('y_train_all_y0.mat')%%%导入只含y=1的y结果数据

%% PCA对64通道数据进行处理  
X_train_1 =squeeze(Xy_1.X_train(:,11,:));
X_train_0 =squeeze(Xy_0.X_train(:,11,:));
[pc,score,latent,tsquare] = princomp(X_train_1);%每行代表一个样本观察数据，每列则代表一个属性，或特征


% X_train_2 =squeeze(X_train(:,11,:));%%%%%%从156*1*3420->156*3420
% X_train_1 =squeeze(Xy_1.X_train(:,11,:));
% all_train_Xpart=cat(2,X_train_2,X_train_1);%%%%%%%%%增加样本标签=1的数的操作。
% all_train_Ypart=cat(2,y_train,yy_1.y_train);


%% 标准化
X_normailzation=mapstd(X_train_2')';
%% 合并x,y_train
all_train = cat(1,all_train_Xpart,all_train_Ypart);
% all_train=cat(1,X_normailzation,y_train);
%% 进行乱序
randIndex = randperm(size(all_train,2));
all_train_L = all_train(:,randIndex);

%% 读取测试集
load('X_test_all.mat')
X_test_2 =squeeze(X_test(:,11,:));
X_test_normailzation=mapstd(X_test_2')';
% 
% [trainedClassifier_KNN, validationAccuracy] = trainClassifier_KNNCUBIC(all_train)
% y_fit2 = trainedClassifier_KNN.predictFcn(X_train_2)';

% pos=find(y_fit2==1)

