%%
clc
% clear
%%
prefix=('C:\Users\Think\Desktop\������\BCI_competition_2\BCI_II_���ݼ�2_b\data\data\');
d=dir('*.mat');

CHAR_position_test =[];
CHAR_position_train =[];
X_train=[];
y_train=[];
X_test=[];
%% train data get %%
for i=1:11   %%%%AAS010R01-05
%    t(i)=load([prefix,d(i+5).name]);
   t(i)=load([prefix,d(i).name]);
   size(t(i).PhaseInSequence);
   CHAR1=strfind((t(i).PhaseInSequence(100:end)'),[3 1]);%%%%%%%%��ȡ�ı�λ�õ�����
%    CHAR1=strfind((t(i).PhaseInSequence(100:end)'),[2 3])
   size_CHAR1(i)=length(CHAR1)+1;
   CHAR_position_test=[CHAR_position_test,CHAR1];
   [X_part_train,y_part_train]=cut_everymat_y1(t(i).signal,t(i).StimulusType,t(i).trialnr,size_CHAR1(i));
%    All_testcount=size_CHAR1(i)*cont_forchar;%%%%%%%%%ʵ���ܴ�����01�У�������ĸ540��
   X_train=cat(3,X_train,X_part_train);
   y_train=cat(2,y_train,y_part_train);
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
%     [X_part_test]=cut_everymat_test(t_test(j).signal,t_test(j).trialnr,size_CHAR2(j));
% %    All_testcount=size_CHAR1(i)*cont_forchar;%%%%%%%%%ʵ���ܴ�����01�У�������ĸ540��
%    X_test=cat(3,X_test,X_part_test);
% end
% size_CHAR2
% CHAR_position_train

% 
% 
% save('E:/BCI_IIdata/data/X_train_all_y1.mat','X_train')%%%%%%��156��64��,540���ַ�
% save('E:/BCI_IIdata/data/y_train_all_y1.mat','y_train')

% % save('E:/BCI_IIdata/data/X_test_all.mat','X_test')%%%%%%��156��64��,540���ַ�