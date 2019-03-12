
 %% find Y1Y0

pos=find(y_train==1);

X_train_y1=X_train(:,:,pos);
Z_train_y1=StimulusCode_train(:,pos);
y_train_y1=y_train(:,pos);

pos0=find(y_train==0);

X_train_y0=X_train(:,:,pos0);
Z_train_y0=StimulusCode_train(:,pos0);
y_train_y0=y_train(:,pos0);
%%
for chan =1:2
for testcont = 1:200
data_for_fractalDIM=squeeze(X_train(:,chan,testcont));  %%%156*64*1176
% plot(data_for_fractalDIM,'r')
% hold on
FD(chan,testcont,:)=fractalDIM(data_for_fractalDIM');
% data_for_fractalDIM=squeeze(X_train_y0(:,chan,testcont));  %%%156*64*1176
% plot(data_for_fractalDIM,'b')
% FD(2,testcont,:)=fractalDIM(data_for_fractalDIM');
end
hold on
plot(squeeze(FD(1,:,:)),'-')

% plot(squeeze(FD(2,:,:)),'-b')
hold off
drawnow
FDall(chan,:,:,:)=FD(chan,:);
end
legend('y1','y0')

%%
% for chan =1:64
%     
%     fd_al=fractalDIM(Chang_signal(:,chan));
%     
% end
% y=genewei(4096,0.6)+2;
% x=[0:4095]'/4096;
% PointsList=[x,y];
% Size=[1/2,1/4];
% Ratio=[1,4];
% [boxdim,Nboxes,handlefig]=boxdim_listepoints(PointsList, Size, Ratio)
% 
% chan=1
testcont=3
% load the list of points
% load('fusee.mat');
data_for_fractalDIM=squeeze(Chang_signal(:,4))%(X_train(:,chan,testcont));
% Plot the list of points
figure;plot(1:length(data_for_fractalDIM),data_for_fractalDIM,'.-');
% Compute its box dimension
reg=1; Waitbar=1;
[boxdim,Ntailles,handlefig,bounds]=boxdim_listepoints(data_for_fractalDIM,[],[],Waitbar,reg);
boxdim;
bounds;
% You should find bounds = -6 -2. This means that
% the progression is linear when log2(size) is in [-6 -2]. You may keep these
% bounds, take more points and try another regression type.
reg=0; Size=2.^[-6 : 0.5 : -2];
boxdim=boxdim_listepoints(data_for_fractalDIM,Size,[],Waitbar,reg,'pls',30);
boxdim
