% clear
% load('M_X_train_all.mat')
% load('M_y_train_all.mat')
% load('M_z_train_all.mat')


pos=find(y_train==1);

X_train_y1=X_train(:,:,pos);
Z_train_y1=StimulusCode_train(:,pos);
y_train_y1=y_train(:,pos);

pos0=find(y_train==0);

X_train_y0=X_train(:,:,pos0);
Z_train_y0=StimulusCode_train(:,pos0);
y_train_y0=y_train(:,pos0);

