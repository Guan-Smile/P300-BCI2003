

% clc
% load('X_train_S010.mat')
% load('y_train_S010.mat')
Xy_1=X_train_y1;%%%%����ֻ��y=1��xѵ������
yy_1=y_train_y1;%%%����ֻ��y=1��y�������
Xy_0=X_train_y0;%%%%����ֻ��y=1��xѵ������
yy_0=y_train_y0;%%%����ֻ��y=1��y�������


%% PCA��64ͨ�����ݽ��д���
% SCE=[];
% SCE0=[];

%% ǿ�����ݼ�
for i=1:size(Xy_1,3)
X_train_1 =squeeze(Xy_1(:,:,i));

[pc,score,latent,tsquare] = pca(X_train_1);%ÿ�д���һ�������۲����ݣ�ÿ�������һ�����ԣ�������
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

%% ��ǿ�����ݼ�
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

%% �ϲ��������ݼ�
 SCE_1 =squeeze(SCE(:,1,:));
 SCE0_1 =squeeze(SCE0(:,1,:));
 all_train_Xpart=cat(2,SCE_1,SCE0_1(:,1:length(SCE_1)));
%  all_train_Xpart=cat(2,all_train_Xpart,SCE_1);%%%%%%����һ����ǿ����
 all_train_Ypart=cat(2,yy_1,yy_0(1:length(yy_1)));
%  all_train_Ypart=cat(2,all_train_Ypart,yy_1);%%%%����һ����ǿ����
 all_train_Zpart=cat(2,Z_train_y1,Z_train_y0(1:length(Z_train_y1)));
 
 %% ��׼��
X_normailzation=mapstd(all_train_Xpart')';
%% �ϲ�x,y_train
all_train = cat(1,X_normailzation,all_train_Ypart);%%%%%%ִ�б�׼��
% all_train=cat(1,X_normailzation,y_train);
%% ��������
randIndex = randperm(size(all_train,2));
all_train_L = all_train(:,randIndex);

%% ��ȡ���Լ�
% load('M_X_test_all_block_14.mat');
SCE_test=[];
for k=1:size(X_test,3)
X_test_1 =squeeze(X_test(:,:,k));

[pc,score,latent,tsquare] = pca(X_test_1);%ÿ�д���һ�������۲����ݣ�ÿ�������һ�����ԣ�������
SCE_test(:,:,k)=score*pc';

end
SCE_test_1 =squeeze(SCE_test(:,1,:));

X_test_normailzation=mapstd(SCE_test_1')';
% 

 %% ʹ��ģ��
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
