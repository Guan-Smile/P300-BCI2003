% % liuyang论文提出的T加权判别法

%% 训练线性分类器，得到all_train_L
   %先置运行函数：testusemod.m

%% 求权重值a (公式4.9)

M_sce=mean(SCE,3);%%类别1的平均值x1,x2,x3......
M_sce0=mean(SCE0,3);%%类别2的平均值y1,y2,y3......
M_sce_test=mean(SCE_test,3);
aa_ALL=[];
A_sce0=[];
A_sce=[];
for n =1:64
SCE_n =squeeze(SCE(:,n,:));
SCE0_n =squeeze(SCE0(:,n,:));
D_sce=std(SCE_n');%%类别1的协方差......
D_sce0=std(SCE0_n');%%类别2的协方差.....
aa_1= (M_sce(:,n)-M_sce0(:,n));
aa_2=(size(SCE_1,2).*D_sce+size(SCE0_1,2).*D_sce0);
aa=(aa_1./(aa_2)');

aa_ALL=[aa_ALL;aa'];
A_sce=[A_sce;aa'*SCE_n];
A_sce0=[A_sce0;aa'*SCE0_n];

end
%% 求加权和
% A_sce=aa'*SCE_1;
% A_sce0=aa'*SCE0_1;
% A_sce=sum(SCE_1(60:80,:));
% A_sce0=sum(SCE0_1(60:80,:));
% A_sce=aa.*SCE_1;
% A_sce0=aa.*SCE0_1;
figure
plot(max(A_sce),'.')
hold on
plot(max(A_sce0),'.')

% A_sce=aa'*SCE_1;
% A_sce0=aa'*SCE0_1;
% figure
% plot(A_sce,'.')
% hold on
% plot(A_sce0,'.')
figure
plot(sum(A_sce),'.')
hold on
plot(sum(A_sce0),'.')

%% plot
% imagesc(pc)
figure
plot(M_sce0(:,1))
hold on
plot(M_sce(:,1))
% plot(aa_1)
plot(M_sce_test(:,1))
drawnow
legend('m0','m1','aa')
%% 合并
A_all_train_Xpart=cat(2,A_sce,A_sce0(:,1:length(A_sce)));
% A_all_train_Xpart=cat(2,A_all_train_Xpart,A_sce);
A_all_train_Ypart=[y_train_y1,y_train_y0(:,1:length(y_train_y1))];
A_all_train_Zpart=cat(2,Z_train_y1,Z_train_y0(:,1:length(Z_train_y1)));

all_train = cat(1,A_all_train_Xpart,A_all_train_Ypart);%%%%
%% 进行乱序
randIndex = randperm(size(all_train,2));
all_train_L = all_train(:,randIndex);

%% 测试集
A_sce_test=[];
for nn =1:64
SCE_test_n =squeeze(SCE_test(:,nn,:));
A_sce_test=[A_sce_test;aa_ALL(nn,:)*SCE_test_n];
end

%% 使用模型
load('classifier_14.mat')
yfit = train_ESKNN.predictFcn(A_sce_test)';
pos=[];
% pos=find(y_fit2==1)
pos=find(yfit==1);
size(pos)
% load('Z_test_all.mat')
% fin_pos=StimulusCode_test(pos)

% load('M_Z_train_all.mat')
% fin_pos=all_train_Zpart(pos)

%  load('M_Z_test_all.mat')
  load('M_z_test_all_block_11.mat')
fin_pos=StimulusCode_test(pos)
% fin_pos=StimulusCode_test(pos)
