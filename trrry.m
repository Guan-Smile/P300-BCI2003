
% xx=load('M_X_train_all_block_fft_12.mat')
%  bb=load('M_X_train_all_block_12.mat')
for i=1:200
  plot(mean(xx.X_train(:,15,i)))
  hold on
plot(mean(bb.X_train(:,15,i)))

end
drawnow