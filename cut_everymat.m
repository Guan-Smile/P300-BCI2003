function [X_train,y_all] = cut_everymat(signal,StimulusType,trialnr,Num_dataChar)

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
y_all=zeros(1,All_testcount);
% count=0;
for cul_trai=1:All_testcount
trialidx=(find(trialnr==cul_trai));%每次强调的数据点
% if (max(StimulusType(trialidx))==1)
%     count=count+1;
    trialdata(:,:,cul_trai)=signal(min(trialidx):min(trialidx)+triallength_time-1, :);%%%%%对数据点切割，取625-780，。。
% X_train=trialdata;
    y_all(:,cul_trai) = max(StimulusType(trialidx));
end
X_train=trialdata;
%%  figure
% title('理解P300信号的意义')
% % timems=[1:triallength]/samplefreq*1000;
% % plot(timems,tr nialdata)
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

%   
% save('E:/BCI_IIdata/data/X_train_10.mat','trialdata')%%%%%%行156，64列,540个字符
% save('E:/BCI_IIdata/data/y_train_10.mat','y_all')

