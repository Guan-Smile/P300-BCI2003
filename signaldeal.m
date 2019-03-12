% % 
% % ALL_cc=[];
% % figure()
% for j=1:64
%     
% %     cc=fft(t(i).signal(:,j));
%     hold on
% %     plot(abs(cc))
% %     ALL_cc=[ALL_cc;cc];
% periodogram(t(i).signal(:,j),hamming(length(t(i).signal(:,j))),[],240);
%     drawnow
%     
% end

% % 
for i=1:2
[f,sy,peak,i,eegx]= FFT_detection(t(i).signal,240);
%  
end
%    
% n = 0:319;
% x = cos(pi/4*n)+randn(size(n));
% [pxx,w] = periodogram(x);
% plot(w,10*log10(pxx),'r')
% 
% for jj=1:2
% periodogram(t(jj).signal,hamming(length(t(jj).signal)),[],240);
% hold on
% drawnow
% end
% % 
%    