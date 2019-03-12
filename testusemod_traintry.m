% clear
% clc
for BLOK=4:14
load(['E:/BCI_IIdata/data/M_X_train_all_block_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/M_y_train_all_block_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/M_z_train_all_block_',num2str(BLOK),'.mat'])
% 
load(['E:/BCI_IIdata/data/M_X_test_all_block_new3_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/M_z_test_all_block_new3_',num2str(BLOK),'.mat'])

%% ���Լ�pca
% load('M_X_test_all_block_14.mat');
SCE_test=[];
for k=1:size(X_train,3)
X_test_1 =squeeze(X_train(:,:,k));

% [pc,score,latent,tsquare] = pca(X_test_1);%ÿ�д���һ�������۲����ݣ�ÿ�������һ�����ԣ�������
SCE_test(:,:,k)=X_test_1-mean(X_test_1);

end
SCE_test_1 =squeeze(SCE_test(:,1,:));

% X_test_normailzation=mapstd(SCE_test_1')';

% load('aa_ALL.mat')
load(['aa_ALL_new',num2str(BLOK),'.mat'])


A_sce_test=[];
for nn =1:64
SCE_test_n =squeeze(SCE_test(:,nn,:));
A_sce_test=[A_sce_test;aa_ALL(nn,:)*SCE_test_n];
end

%% ʹ��ģ��
load('classifier_14.mat')
% yfit = trainedModel_esd.predictFcn(A_sce_test)';
yfit = trainedModel15.predictFcn(A_sce_test)';
pos=[];
% pos=find(y_fit2==1)
pos=find(yfit==1);
% size(pos);
% load('Z_test_all.mat')
% fin_pos=StimulusCode_test(pos)

% load('M_Z_train_all.mat')
% fin_pos=all_train_Zpart(pos)

%  load('M_Z_test_all.mat')
%   load('M_Z_test_all_block_14.mat')
fin_pos=StimulusCode_train(pos);
% fin_pos=StimulusCode_test(pos)
% 
% %% ������
titlechar='ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789-';
result='FOODMOOTHAMPIECAKETUNAZYGOT4567';
resulttrain='CATDOGFISHWATERBOWLHATHATGLOVESHOESFISHRAT';
fprintf(' \n BLOCK=%d',BLOK)
 fprintf('     \n')
fprintf( '\n Length pos is: %d',length(pos) )

fprintf(1, '\n Predicted character is: \n' )
succ=0;
for coni=1:length(yfit)/14/12
    xx=[];
    yy=[];
    pos2=find(yfit(1+168*(coni-1):168*(coni))==1);
    fin_pos_p=StimulusCode_train(pos2);
    plot(yfit(1+168*(coni-1):168*(coni)),'p')
    for i=1:length(fin_pos_p)
    if (fin_pos_p(i)>6)
        yy=[yy,fin_pos_p(i)];
    end
    if (fin_pos_p(i)<=6)
        xx=[xx,fin_pos_p(i)];
    end
    
    end
    if length(yy)<1
%     yy_m=round(mean(yy(1:length(yy)-1)));
      yy_m=7;
    else
        yy_m=round(mean(yy));
    end
    if length(xx)<1
%     xx_m=round(mean(xx(1:length(xx)-1)));
      xx_m=1;
    else
        xx_m=round(mean(xx));
    end
    
    if titlechar(xx_m+(yy_m-6-1)*6)==resulttrain(coni)
        succ=succ+1;
    fprintf(1, '%c', titlechar(xx_m+(yy_m-6-1)*6));
    else 
        fprintf('*')
    end
end
 fprintf('     \n')
fprintf( '%c', resulttrain);
fprintf( '\n success number is: %d',succ )
% fprintf('    BLOCK=%d',BLOK)
 fprintf('     \n')
 
end
