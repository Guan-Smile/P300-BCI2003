%% get_aa_ALL
% clc
% clear
for BLOK=1:14
% load(['E:/BCI_IIdata/data/M_X_train_all_block_',num2str(BLOK),'.mat'])
% load(['E:/BCI_IIdata/data/M_y_train_all_block_',num2str(BLOK),'.mat'])
% load(['E:/BCI_IIdata/data/M_z_train_all_block_',num2str(BLOK),'.mat'])
% % 
% load(['E:/BCI_IIdata/data/M_X_test_all_block_new3_',num2str(BLOK),'.mat'])
% load(['E:/BCI_IIdata/data/M_z_test_all_block_new3_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_X_train_all_block_fft_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_y_train_all_block_fft_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_z_train_all_block_fft_',num2str(BLOK),'.mat'])
% 
load(['E:/BCI_IIdata/data/fft/M_X_test_all_block_fft_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_z_test_all_block_fft_',num2str(BLOK),'.mat'])

%% find Y1Y0

pos=find(y_train==1);

X_train_y1=X_train(:,:,pos);
Z_train_y1=StimulusCode_train(:,pos);
y_train_y1=y_train(:,pos);

pos0=find(y_train==0);

X_train_y0=X_train(:,:,pos0);
Z_train_y0=StimulusCode_train(:,pos0);
y_train_y0=y_train(:,pos0);

%% pca_try_fun


SCE_test=[];
for k=1:size(X_test,3)
X_test_1 =squeeze(X_test(:,:,k));

% [pc,score,latent,tsquare] = pca(X_test_1);%ÿ�д���һ�������۲����ݣ�ÿ�������һ�����ԣ�������
SCE_test(:,:,k)=X_test_1-mean(X_test_1);

end
SCE_test_1 =squeeze(SCE_test(:,1,:));

X_test_normailzation=mapstd(SCE_test_1')';
% 
Xy_1=X_train_y1;%%%%����ֻ��y=1��xѵ������
yy_1=y_train_y1;%%%����ֻ��y=1��y�������
Xy_0=X_train_y0;%%%%����ֻ��y=1��xѵ������
yy_0=y_train_y0;%%%����ֻ��y=1��y�������
% ǿ�����ݼ�

for i=1:size(Xy_1,3)
X_train_1 =squeeze(Xy_1(:,:,i));

% [pc,score,latent,tsquare] = pca(X_train_1);%ÿ�д���һ�������۲����ݣ�ÿ�������һ�����ԣ�������
SCE(:,:,i)=X_train_1-mean(X_train_1);
% score;
% TS(:,i)=tsquare;
% imagesc(pc)
% colorbar;
% plot(score(:,1))%
% % plot(tsquare0,'b')
% hold on
% drawnow
end

% ��ǿ�����ݼ�
for j=1:size(Xy_0,3)
    X_train_0 =squeeze(Xy_0(:,:,j));
%     [pc0,score0,latent0,tsquare0] = pca(X_train_0);
    SCE0(:,:,j)=X_train_0-mean(X_train_0);
%     TS0(:,j)=tsquare0;
%     plot(tsquare0,'b')
%     hold on
%     drawnow
end
% figure()
% plot(mean(SCE,3))
% figure()
% plot(mean(SCE0,3))

% �������ݼ�
 SCE_1 =squeeze(SCE(:,1,:));
 SCE0_1 =squeeze(SCE0(:,1,:));
 
 %% TȨֵ����
 
M_sce=mean(SCE,3);%%���1��ƽ��ֵx1,x2,x3......
M_sce0=mean(SCE0,3);%%���2��ƽ��ֵy1,y2,y3......
M_sce_test=mean(SCE_test,3);
aa_ALL=[];
A_sce0=[];
A_sce=[];
for n =1:64
SCE_n =squeeze(SCE(:,n,:));
SCE0_n =squeeze(SCE0(:,n,:));
D_sce=std(SCE_n');%%���1��Э����......
D_sce0=std(SCE0_n');%%���2��Э����.....
aa_1= (M_sce(:,n)-M_sce0(:,n));
aa_2=(size(SCE_1,2).*D_sce+size(SCE0_1,2).*D_sce0);
aa=(aa_1./(aa_2)');

aa_ALL=[aa_ALL;aa'];
A_sce=[A_sce;aa'*SCE_n];
A_sce0=[A_sce0;aa'*SCE0_n];

end

save(['E:/BCI_IIdata/data/fft/aa_ALL_fft',num2str(BLOK),'.mat'],'aa_ALL')


end
%% ���Ȩ��

% % figure
% % plot(sum(A_sce),'.')
% % hold on
% % plot(sum(A_sce0),'.')
% % 
% % % plot
% % imagesc(pc)
% % figure
% % plot(M_sce0(:,1))
% % hold on
% % plot(M_sce(:,1))
% % plot(aa_1)
% % plot(M_sce_test(:,1))
% % drawnow
% % legend('m0','m1','aa')
 