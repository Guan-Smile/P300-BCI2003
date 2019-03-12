function [M_X_train_all,M_y_train_all,M_z_train_all] = cut_everymat_block2(signal,StimulusType,trialnr,Num_dataChar,StimulusCode,or01,block)

% [X_train,y_all,StimulusCode_train] = cut_everymat_y1(signal,StimulusType,trialnr,Num_dataChar,StimulusCode,or01,block)


%block:准备平均的块数（1~15）
samplefreq=240;
triallength=650;%%%ms
cont_forchar=180;%一个字母的总实验次数
All_testcount=Num_dataChar*cont_forchar;%%%%%%%%%实验总次数，01中，三个字母540次
p300=round(300*samplefreq/1000)
% trialidx=625;%每次强调的起始点
triallength_time=round(triallength*samplefreq/1000)%ms到点数的换算

% alll_trail=zeros(156,64);
% count=1;
% trialdata=zeros(triallength_time,64,All_testcount);%%%%%%
trialdata=[];
y_all=[];
% y_all=zeros(1,All_testcount);
count=0;
cot=1;
for cul_trai=1:All_testcount
trialidx=(find(trialnr==cul_trai));%每次强调的数据点
StimulusCode_train(:,cul_trai) = max(StimulusCode(trialidx));%%%%%%%记录StimulusCode_train
if (or01 == 2)
    count=cul_trai;%%%%%%%%%%全部读取
    trialdata(:,:,count)=signal(min(trialidx):min(trialidx)+triallength_time-1, :);%%%%%对数据点切割，取625-780，。。
    y_all(:,count) = max(StimulusType(trialidx));
    StimulusCode_train_y1(:,count) = max(StimulusCode(trialidx));%%%%%%%记录StimulusCode_train
else
if (max(StimulusType(trialidx))==or01)%%%%%y1&&&y0!!!! %%%%读取部分
    count=count+1;
    trialdata(:,:,count)=signal(min(trialidx):min(trialidx)+triallength_time-1, :);%%%%%对数据点切割，取625-780，。。
    y_all(:,count) = max(StimulusType(trialidx));
    StimulusCode_train_y1(:,count) = max(StimulusCode(trialidx));%%%%%%%记录StimulusCode_train
end
end   
end
X_train=trialdata;
%%  block平均
M_z_train_all=[];
for kk=1:Num_dataChar
    for i=1:12
%        pos=find(StimulusCode_train(:,1+(kk-1)*180:(kk)*180)==i);
       pos=find(StimulusCode_train(:,:)==i);%每12个数行列随机闪一遍
%       for jj=1:14%size(pos,2)-1   %%%变更每次求平均的数据顺序
          pos_char=pos(1+(kk-1)*15:kk*15);
%             pos_char = circshift(pos_char,jj);
%             size(pos)
       postion_o=reshape(pos_char(1:(block)),block,1); %fix(15./block)
       postion=nchoosek(postion_o,block-1);
%        postion=reshape(pos_char(1:(block*fix(15./block))),block,fix(15./block));
       
       for j=1:size(postion,1)
       M_X_train=mean(X_train(:,:,postion(j,:)),3);
       M_X_train_all(:,:,cot) = M_X_train;
       M_y_train=round(mean(y_all(:,postion(j,:))));
       M_y_train_all(:,cot)=M_y_train;
       M_z_train_all(:,cot)=i;      
%        plot(M_X_train(:,15))
%        hold on
       cot=cot+1;
       end
%        M_y_train_all;
%       end
    end
    
end
M_z_train_all;
% M_y_train_all;

% 
% save('E:/BCI_IIdata/data/X_train_10.mat','trialdata')%%%%%%行156，64列,540个字符
% save('E:/BCI_IIdata/data/y_train_10.mat','y_all')

