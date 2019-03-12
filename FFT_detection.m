function [Chang_signal]=FFT_detection(data_ori,Fs);

% [f,sy,peak,eegx]
%data-- Ҫ���������
%Fs---  ������
%y----  ���ط�ֵ����x
for kk=1:64
data=data_ori(:,kk)';                            %�ź�ѡȡ����ͨ���Ĳ������ݣ�����ѡ��Ϊ(7-->POZ-->56)
L1=length(data);
NFFT = 2^nextpow2(L1)                      %ȷ����Ҫ���д�������ݵ���
% NFFT=256
% [B A]=butter(10,[4/(Fs/2) 50/(Fs/2)]);       %butter��2�׵İ�����˹�˲���  ��Ϊ���½�ֹƵ��
[B A]=butter(12,50/(Fs/2));
eegx=filter(B,A,data);                      %filter��һά�����˲����� x1���˲�ǰ���У�BΪ���ӣ�AΪ��ĸ 
Chang_signal(:,kk)=eegx;%(1:L1);
%% plot
hold on
Y1 = fft(eegx,NFFT);                        %����fft�任

sy=abs(Y1(1:NFFT));                         %ȥģ                 
sy=sy/(NFFT/2);                             %��ʵ�ʷ�ֵ
sy(1)=sy(1)/2;
f=([1:NFFT]-1)*Fs/NFFT;                     %��ʵ��Ƶ��
[qy,qx]=max(sy);
peak=(qx-1)/(NFFT/Fs);                      %����ֵ����Ƶ��ֵ peak=(qx-1)*Fs/NFFT
i=qx-1;
fprintf(['fft spectrum max is [x=',num2str(peak),', y=',num2str(qy*2),'] \n'])
plot(f,2*sy,'-.');
text(peak,qy*2,['(',num2str(peak),',',num2str(qy*2),')']);  %������ϵ����ʾ����
title('����-Ƶ������ͼ');
axis([0 70 0 100]);
ylabel('��ֵ');xlabel('Ƶ��(hz)');
drawnow
end
