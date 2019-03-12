function [Chang_signal]=FFT_detection(data_ori,Fs);

% [f,sy,peak,eegx]
%data-- 要处理的数据
%Fs---  采样率
%y----  返回峰值最大的x
for kk=1:64
data=data_ori(:,kk)';                            %信号选取单个通道的采样数据，这里选择为(7-->POZ-->56)
L1=length(data);
NFFT = 2^nextpow2(L1)                      %确定需要进行处理的数据点数
% NFFT=256
% [B A]=butter(10,[4/(Fs/2) 50/(Fs/2)]);       %butter：2阶的巴特沃斯滤波器  后为上下截止频率
[B A]=butter(12,50/(Fs/2));
eegx=filter(B,A,data);                      %filter：一维数字滤波器， x1是滤波前序列，B为分子，A为分母 
Chang_signal(:,kk)=eegx;%(1:L1);
%% plot
hold on
Y1 = fft(eegx,NFFT);                        %进行fft变换

sy=abs(Y1(1:NFFT));                         %去模                 
sy=sy/(NFFT/2);                             %求实际幅值
sy(1)=sy(1)/2;
f=([1:NFFT]-1)*Fs/NFFT;                     %求实际频率
[qy,qx]=max(sy);
peak=(qx-1)/(NFFT/Fs);                      %最大峰值处的频率值 peak=(qx-1)*Fs/NFFT
i=qx-1;
fprintf(['fft spectrum max is [x=',num2str(peak),', y=',num2str(qy*2),'] \n'])
plot(f,2*sy,'-.');
text(peak,qy*2,['(',num2str(peak),',',num2str(qy*2),')']);  %在坐标系中显示顶点
title('幅度-频率曲线图');
axis([0 70 0 100]);
ylabel('幅值');xlabel('频率(hz)');
drawnow
end
