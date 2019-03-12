function [M_X_test_all,M_z_test_all] = cut_everymat_test(signal,trialnr,Num_dataChar,StimulusCode,block)

samplefreq=240;
triallength=650;%%%ms
cont_forchar=180;%一个字母的总实验次数
All_testcount=Num_dataChar*cont_forchar;%%%%%%%%%实验总次数，01中，三个字母540次
p300=round(300*samplefreq/1000)
% trialidx=625;%每次强调的起始点
triallength_time=round(triallength*samplefreq/1000)%ms到点数的换算

% alll_trail=zeros(156,64);
% count=1;
trialdata=zeros(triallength_time,64,All_testcount);%%%%%%
% y_all=zeros(1,All_testcount);
for cul_trai=1:All_testcount
trialidx=(find(trialnr==cul_trai));%每次强调的数据点

trialdata(:,:,cul_trai)=signal(min(trialidx):min(trialidx)+triallength_time-1, :);%%%%%对数据点切割，取625-780，。。
StimulusCode_test(:,cul_trai) = max(StimulusCode(trialidx));
% y_all(:,cul_trai) = max(StimulusType(trialidx));
%%  figure
% title('理解P300信号的意义')
% % timems=[1:triallength]/samplefreq*1000;
% % plot(timems,trialdata)
% % (StimulusType(trialidx));
% if (max(StimulusType(trialidx))==1)%%%%区分有无注意的行列==1///==0
% axis([0 size(trialdata(:,:,cul_trai), 1) -1500 1500]);%%%固定行列坐标
% % alll_trail=alll_trail+trialdata;%%%%求和
% plot(trialdata(:,11,cul_trai))%%选取通道
% % plot(alll_trail(:, 8)./count)%%选取通道，取平均
% hold on
% plot(p300,[-1000:50:1000],'gp')
% % drawnow
% % pause(0.5)
% count=count+1;  
% cul_trai
% end
%%
end
X_test=trialdata;
%%  block平均
cont=1;
M_z_test_all=[];
for kk=1:Num_dataChar
    for i=1:12
%        pos=find(StimulusCode_train(:,1+(kk-1)*180:(kk)*180)==i);
       pos=find(StimulusCode_test(:,:)==i);
       size(pos);
        for jj=1:14
          pos_char=pos(1+(kk-1)*15:kk*15);
            pos_char = circshift(pos_char,jj);%+mod(jj,10));
%             size(pos)
%        postion=reshape(pos_char,block,15./block);
%        postion=reshape(pos(1+(kk-1)*15:kk*15),block,15./block);
        postion=reshape(pos_char(1:(block)),block,1); %fix(15./block)
%         postion=reshape(pos_char(1:(block*fix(15./block))),block,fix(15./block)); %fix(15./block)
       for j=1:size(postion,2)
       M_X_test=mean(X_test(:,:,postion(:,j)),3);
       M_X_test_all(:,:,cont) = M_X_test;
%        M_y_train=mean(y_all(:,postion(:,j)));
%        M_y_train_all(:,cot)=M_y_train;
       M_z_test_all(:,cont)=i;      
%        plot(M_X_test(:,15));
%        hold on
       cont=cont+1;
       end
        end
    end
end
M_z_test_all;
% M_y_train_all;


% 
% save('E:/BCI_IIdata/data/X_train_10.mat','trialdata')%%%%%%行156，64列,540个字符
% save('E:/BCI_IIdata/data/y_train_10.mat','y_all')

