load('X_train_S010.mat')
load('y_train_S010.mat')
Xy_1=load('X_train_all_y1.mat')%%%%����ֻ��y=1��xѵ������
yy_1=load('y_train_all_y1.mat')%%%����ֻ��y=1��y�������
Xy_0=load('X_train_all_y0.mat')%%%%����ֻ��y=1��xѵ������
yy_0=load('y_train_all_y0.mat')%%%����ֻ��y=1��y�������


%% PCA��64ͨ�����ݽ��д���
% SCE=[];
% SCE0=[];
for i=1:size(Xy_1.X_train,3)
X_train_1 =squeeze(Xy_1.X_train(:,:,i));

[pc,score,latent,tsquare] = pca(X_train_1);%ÿ�д���һ�������۲����ݣ�ÿ�������һ�����ԣ�������
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

