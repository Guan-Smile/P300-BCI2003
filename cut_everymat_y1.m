function [X_train,y_all,StimulusCode_train] = cut_everymat_y1(signal,StimulusType,trialnr,Num_dataChar,StimulusCode,or01)

samplefreq=240;
triallength=650;%%%ms
cont_forchar=180;%һ����ĸ����ʵ�����
All_testcount=Num_dataChar*cont_forchar;%%%%%%%%%ʵ���ܴ�����01�У�������ĸ540��
p300=round(300*samplefreq/1000)
% trialidx=625;%ÿ��ǿ������ʼ��
triallength_time=round(triallength*samplefreq/1000)%ms�������Ļ���

% alll_trail=zeros(156,64);
% count=1;
% trialdata=zeros(triallength_time,64,All_testcount);%%%%%%
trialdata=[];
y_all=[];
% y_all=zeros(1,All_testcount);
count=0;
for cul_trai=1:All_testcount
trialidx=(find(trialnr==cul_trai));%ÿ��ǿ�������ݵ�
StimulusCode_train(:,cul_trai) = max(StimulusCode(trialidx));%%%%%%%��¼StimulusCode_train
if (max(StimulusType(trialidx))==or01)%%%%%y1&&&y0!!!!
    count=count+1;
    trialdata(:,:,count)=signal(min(trialidx):min(trialidx)+triallength_time-1, :);%%%%%�����ݵ��иȡ625-780������
% X_train=trialdata;
    y_all(:,count) = max(StimulusType(trialidx));
    
end
%%  figure
% title('���P300�źŵ�����')
% % timems=[1:triallength]/samplefreq*1000;
% % plot(timems,trialdata)
% % (StimulusType(trialidx));
% if (max(StimulusType(trialidx))==1)%%%%��������ע�������==1///==0
% axis([0 size(trialdata(:,:,cul_trai), 1) -1500 1500]);%%%�̶���������
% % alll_trail=alll_trail+trialdata;%%%%���
% plot(trialdata(:,11,cul_trai))%%ѡȡͨ��
% % plot(alll_trail(:, 8)./count)%%ѡȡͨ����ȡƽ��
% hold on
% plot(p300,[-1000:50:1000],'gp')
% % drawnow
% % pause(0.5)
% count=count+1;
% cul_trai
% end
%%
end
X_train=trialdata;
% 
% save('E:/BCI_IIdata/data/X_train_10.mat','trialdata')%%%%%%��156��64��,540���ַ�
% save('E:/BCI_IIdata/data/y_train_10.mat','y_all')

