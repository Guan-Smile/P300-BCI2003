%%
clc
clear
%%
prefix=('C:\Users\Think\Desktop\������\BCI_competition_2\BCI_II_���ݼ�2_b\data\data\');
d=dir('*.mat');
for BLOK = 6:14
CHAR_position_test =[];
CHAR_position_train =[];
X_train=[];
y_train=[];
X_test=[];
StimulusCode_train=[];
StimulusCode_test=[];


% BLOK=14;%%%%%%ÿ10������ȡһ��ƽ��
%% train data get %%
for i=1:11   %%%%AAS010R01-05
%    t(i)=load([prefix,d(i+5).name]);
   t(i)=load([prefix,d(i).name]);
   size(t(i).PhaseInSequence);
   CHAR1=strfind((t(i).PhaseInSequence(100:end)'),[3 1]);%%%%%%%%��ȡ�ı�λ�õ�����
%    CHAR1=strfind((t(i).PhaseInSequence(100:end)'),[2 3])
   size_CHAR1(i)=length(CHAR1)+1;
   CHAR_position_test=[CHAR_position_test,CHAR1];
   [X_part_train,y_part_train,StimulusCode]=cut_everymat_block (t(i).signal...
       ,t(i).StimulusType,t(i).trialnr,size_CHAR1(i),t(i).StimulusCode,2,BLOK);%%%%or01����ɼ�ǿ��0����1�ĵ�;block���������ȡƽ��
%    All_testcount=size_CHAR1(i)*cont_forchar;%%%%%%%%%ʵ���ܴ�����01�У�������ĸ540��
   X_train=cat(3,X_train,X_part_train);
   y_train=cat(2,y_train,y_part_train);
   StimulusCode_train=[StimulusCode_train,StimulusCode];
end
size_CHAR1
CHAR_position_test


%% train_all data get 



%% test data get
% for i=12:19   %%%%AAS012R01-08
%     j=i-11;
%    t_test(j)=load([prefix,d(i).name]);
%    size(t_test(j).PhaseInSequence);
%    CHAR2=strfind((t_test(j).PhaseInSequence(100:end)'),[3 1]);%%%%%%%%��ȡ�ı�λ�õ�����
% %    CHAR1=strfind((t(i).PhaseInSequence(100:end)'),[2 3])
%    size_CHAR2(i-11)=length(CHAR2)+1;
%    CHAR_position_train=[CHAR_position_train,CHAR2];
%     [X_part_test,StimulusCode]=cut_everymat_test2(t_test(j).signal,t_test(j).trialnr,size_CHAR2(j),t_test(j).StimulusCode,BLOK);
% %    All_testcount=size_CHAR1(i)*cont_forchar;%%%%%%%%%ʵ���ܴ�����01�У�������ĸ540��
%    X_test=cat(3,X_test,X_part_test);
%    StimulusCode_test=[StimulusCode_test,StimulusCode];
% end
% size_CHAR2
% CHAR_position_train
% 
% % 

%  save('E:/BCI_IIdata/data/M_X_train_all.mat','X_train')%%%%%%��156��64��,540���ַ�
%  save('E:/BCI_IIdata/data/M_y_train_all.mat','y_train')

% save('E:/BCI_IIdata/data/M_X_test_all.mat','X_test')%%%%%%��156��64��,540���ַ�
% save('E:/BCI_IIdata/data/M_z_test_all.mat','StimulusCode_test')%%%%%%��156��64��,540���ַ�

%  save('E:/BCI_IIdata/data/M_z_train_all.mat','StimulusCode_train')%%%%%%��156��64��,540���ַ�

save(['E:/BCI_IIdata/data/M_X_train_all_block_ori_',num2str(BLOK),'.mat'],'X_train')
save(['E:/BCI_IIdata/data/M_y_train_all_block_ori_',num2str(BLOK),'.mat'],'y_train')
save(['E:/BCI_IIdata/data/M_z_train_all_block_ori_',num2str(BLOK),'.mat'],'StimulusCode_train')

% save(['E:/BCI_IIdata/data/M_X_test_all_block_new3_',num2str(BLOK),'.mat'],'X_test')%%%%%%��156��64��,540���ַ�
% save(['E:/BCI_IIdata/data/M_z_test_all_block_new3_',num2str(BLOK),'.mat'],'StimulusCode_test')%%%%%%��156��64��,540���ַ�


end