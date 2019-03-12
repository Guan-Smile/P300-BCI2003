% clear
% clc 
SUC_ALL=[];
for BLOK=14%:14
   
% load(['E:/BCI_IIdata/data/M_X_train_all_block_',num2str(BLOK),'.mat'])
% load(['E:/BCI_IIdata/data/M_y_train_all_block_',num2str(BLOK),'.mat'])
% load(['E:/BCI_IIdata/data/M_z_train_all_block_',num2str(BLOK),'.mat'])
% % % 
% % load(['E:/BCI_IIdata/data/M_X_test_all_block_new3_',num2str(BLOK),'.mat'])
% % load(['E:/BCI_IIdata/data/M_z_test_all_block_new3_',num2str(BLOK),'.mat'])
% load(['E:/BCI_IIdata/data/M_X_test_all_block_',num2str(BLOK),'.mat'])
% load(['E:/BCI_IIdata/data/M_z_test_all_block_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_X_train_all_block_fft_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_y_train_all_block_fft_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_z_train_all_block_fft_',num2str(BLOK),'.mat'])
% 
load(['E:/BCI_IIdata/data/fft/M_X_test_all_block_fft_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/M_z_test_all_block_fft_',num2str(BLOK),'.mat'])



%% 测试集pca
% load('M_X_test_all_block_14.mat');
SCE_test=[];
for k=1:size(X_test,3)
X_test_1 =squeeze(X_test(:,:,k));

% [pc,score,latent,tsquare] = pca(X_test_1);%每行代表一个样本观察数据，每列则代表一个属性，或特征
SCE_test(:,:,k)=X_test_1-mean(X_test_1);

end
SCE_test_1 =squeeze(SCE_test(:,1,:));

% X_test_normailzation=mapstd(SCE_test_1')';

% load('aa_ALL.mat')
% load(['aa_ALL_',num2str(BLOK),'.mat'])
load(['E:/BCI_IIdata/data/fft/aa_ALL_fft',num2str(BLOK),'.mat'])
% 
% load(['aa_ALL_new14.mat'])

A_sce_test=[];
for nn =1:64
SCE_test_n =squeeze(SCE_test(:,nn,:));
A_sce_test=[A_sce_test;aa_ALL(nn,:)*SCE_test_n];
end

%% 使用模型
load('classifier_14.mat')
% yfit = trainedModel_esd.predictFcn(A_sce_test)';
yfit = train_LR.predictFcn(A_sce_test)';
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
% fin_pos=StimulusCode_train(pos);
% fin_pos=StimulusCode_test(pos)
% 
% %% 错误率
titlechar='ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789-';
result='FOODMOOTHAMPIECAKETUNAZYGOT4567';
resulttrain='CATDOGFISHWATERBOWLHATHATGLOVESHOESFISHRAT';
fprintf(' \n BLOCK=%d',BLOK)
%  fprintf('     \n')
fprintf( '\n Length pos is: %d',length(pos) )

fprintf(1, '\n Predicted character is: \n' )
succ=0;
CJ2_data_test=[];

for coni=1:31
    xx=[];
    yy=[];
    pos2=find(yfit(1+12*BLOK*(coni-1):12*BLOK*(coni))==1);
    fin_pos_p=StimulusCode_test(pos2);
    plot(yfit(1+12*BLOK*(coni-1):12*BLOK*(coni)),'p')
%     POS_CJ2_test=yfit(1+12*BLOK*(coni-1):12*BLOK*(coni));%%%%%M_new算法对应
    
%     POS_CJ2_test=yfit(1+12*14*(coni-1):12*14*(coni));%%%%%M_old算法对应
    CJ2_data_test=[CJ2_data_test;reshape(POS_CJ2_test,[],2)'];
    
    
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
        if length(yy)>1
    yy_m=round(mean(yy(1:length(yy)-1)));
        end
    end
    if length(xx)<1
%     xx_m=round(mean(xx(1:length(xx)-1)));
      xx_m=1;
    else
        xx_m=round(mean(xx));
         if length(xx)>1
    xx_m=round(mean(xx(1:length(xx)-1)));
        end
    end
%     fprintf(1, '%c', titlechar(xx_m+(yy_m-6-1)*6));
    if titlechar(xx_m+(yy_m-6-1)*6)==result(coni)
        succ=succ+1;
    fprintf(1, '%c', titlechar(xx_m+(yy_m-6-1)*6));
    else 
        fprintf('*')
    end
end
 fprintf('     \n')
fprintf( '%c', result);
fprintf( '\n success number is: %d',succ )
% fprintf('    BLOCK=%d',BLOK)
 fprintf('     \n')
 
%  SUC_ALL=[SUC_ALL,succ./31];
 %% 方法2  CJ2
%   load('CJ_oricode_test.mat')
%     CJ2_judg=[X_CJ2;Y_CJ2-6];
%     CJ2_judg_2=reshape(CJ2_judg,[],1);
    
%     CJ2_all=[CJ2_data,CJ2_judg_2];
    
%     load('CJ_oricode_test.mat')
    
    fin_pos_CJ2=EBT.predictFcn(CJ2_data_test);
    
%     fin_pos_p=fin_pos_CJ2;
      succ=0;
   for cj2cont=1:length(fin_pos_CJ2)/2
         xx_m=fin_pos_CJ2(2*cj2cont-1);
         yy_m=fin_pos_CJ2(2*cj2cont)+6;
         if titlechar(xx_m+(yy_m-6-1)*6)==result(cj2cont)
        succ=succ+1;
    fprintf(1, '%c', titlechar(xx_m+(yy_m-6-1)*6));
    else 
        fprintf('*')
         end
        
    
   end
 fprintf('     \n')
fprintf( '%c', result);
fprintf( '\n success number is: %d',succ )
% fprintf('    BLOCK=%d',BLOK)
 fprintf('     \n')
 
 SUC_ALL=[SUC_ALL,succ./31];
 
           
 
 
end
