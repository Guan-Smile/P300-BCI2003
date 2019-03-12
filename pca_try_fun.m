

% clc
% load('X_train_S010.mat')
% load('y_train_S010.mat')
Xy_1=X_train_y1;%%%%导入只含y=1的x训练数据
yy_1=y_train_y1;%%%导入只含y=1的y结果数据
Xy_0=X_train_y0;%%%%导入只含y=1的x训练数据
yy_0=y_train_y0;%%%导入只含y=1的y结果数据


%% PCA对64通道数据进行处理
% SCE=[];
% SCE0=[];

%% 强调数据集
for i=1:size(Xy_1,3)
X_train_1 =squeeze(Xy_1(:,:,i));

[pc,score,latent,tsquare] = pca(X_train_1);%每行代表一个样本观察数据，每列则代表一个属性，或特征
SCE(:,:,i)=score*pc';
% score;
TS(:,i)=tsquare;
% imagesc(pc)
% colorbar;
% plot(score(:,1))%
% % plot(tsquare0,'b')
% hold on
% drawnow
end

%% 非强调数据集
for j=1:size(Xy_0,3)
    X_train_0 =squeeze(Xy_0(:,:,j));
    [pc0,score0,latent0,tsquare0] = pca(X_train_0);
    SCE0(:,:,j)=score0*pc0';
    TS0(:,j)=tsquare0;
%     plot(tsquare0,'b')
%     hold on
%     drawnow
end
% figure()
% plot(mean(SCE,3))
% figure()
% plot(mean(SCE0,3))

%% 合并两类数据集
 SCE_1 =squeeze(SCE(:,1,:));
 SCE0_1 =squeeze(SCE0(:,1,:));
 all_train_Xpart=cat(2,SCE_1,SCE0_1(:,1:length(SCE_1)));
%  all_train_Xpart=cat(2,all_train_Xpart,SCE_1);%%%%%%增加一倍增强数据
 all_train_Ypart=cat(2,yy_1,yy_0(1:length(yy_1)));
%  all_train_Ypart=cat(2,all_train_Ypart,yy_1);%%%%增加一倍增强数据
 all_train_Zpart=cat(2,Z_train_y1,Z_train_y0(1:length(Z_train_y1)));
 
 %% 标准化
X_normailzation=mapstd(all_train_Xpart')';
%% 合并x,y_train
all_train = cat(1,X_normailzation,all_train_Ypart);%%%%%%执行标准化
% all_train=cat(1,X_normailzation,y_train);
%% 进行乱序
randIndex = randperm(size(all_train,2));
all_train_L = all_train(:,randIndex);

%% 读取测试集
% load('M_X_test_all_block_14.mat');
SCE_test=[];
for k=1:size(X_test,3)
X_test_1 =squeeze(X_test(:,:,k));

[pc,score,latent,tsquare] = pca(X_test_1);%每行代表一个样本观察数据，每列则代表一个属性，或特征
SCE_test(:,:,k)=score*pc';

end
SCE_test_1 =squeeze(SCE_test(:,1,:));

X_test_normailzation=mapstd(SCE_test_1')';
% 

 %% 使用模型
% yfit = trainedModel4.predictFcn(X_test_normailzation)';
% pos=[];
% % pos=find(y_fit2==1)
% pos=find(yfit==1);
% % 
% % load('Z_test_all.mat')
% % fin_pos=StimulusCode_test(pos)
% 
% % load('M_Z_train_all_block_5.mat')
% % fin_pos=all_train_Zpart(pos)
% % 
%  load('M_Z_test_all_block_14.mat')
% fin_pos=StimulusCode_test(pos)
