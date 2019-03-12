load('X_train_S010.mat')
load('y_train_S010.mat')
Xy_1=load('X_train_all_y1.mat')%%%%导入只含y=1的x训练数据
yy_1=load('y_train_all_y1.mat')%%%导入只含y=1的y结果数据
Xy_0=load('X_train_all_y0.mat')%%%%导入只含y=1的x训练数据
yy_0=load('y_train_all_y0.mat')%%%导入只含y=1的y结果数据


%% PCA对64通道数据进行处理
% SCE=[];
% SCE0=[];
for i=1:size(Xy_1.X_train,3)
X_train_1 =squeeze(Xy_1.X_train(:,:,i));

[pc,score,latent,tsquare] = pca(X_train_1);%每行代表一个样本观察数据，每列则代表一个属性，或特征
SCE(:,:,i)=score;
% imagesc(pc)
% colorbar
% plot(tsquare,'r')
% plot(tsquare0,'b')
% hold on
% drawnow
end


for j=1:size(Xy_0.X_train,3)
    X_train_0 =squeeze(Xy_0.X_train(:,:,j));
    [pc0,score0,latent0,tsquare0] = pca(X_train_0);
    SCE0(:,:,i)=score0;
%     plot(tsquare0,'b')
%     hold on
%     drawnow
end
figure()
plot(mean(SCE,3))
figure()
plot(mean(SCE0,3))

