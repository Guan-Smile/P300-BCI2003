
% %% find Y1Y0
% 
% pos=find(y_train==1);
% 
% X_train_y1=X_train(:,:,pos);
% Z_train_y1=StimulusCode_train(:,pos);
% y_train_y1=y_train(:,pos);
% 
% pos0=find(y_train==0);
% 
% X_train_y0=X_train(:,:,pos0);
% Z_train_y0=StimulusCode_train(:,pos0);
% y_train_y0=y_train(:,pos0);
% 
% 
% data_for_fractalDIM=squeeze(X_train_y0(:,chan,21));
%% Fractal Dimension Higuchi algrithm
% clear
function [FDD]=fractalDIM(data_for_fractalDIM)
data = data_for_fractalDIM;
N=length(data);
for k=1:155 % 间隔时间
% k=2;
m=1:k; %起始时间
for ii =1:k
    if ii~=1  %%位数不够补零
    data_X(ii,:)=zeros(size(data(1:k:end)));
    end
    data_X(ii,1:length(data(ii:k:end)))=data(ii:k:end);
     [zero_pos_x,zero_pos_y]=find(data_X(:,1:end-1)==0);
     [zero_pos_x2,zero_pos_y2]=find(circshift(data_X,1,2)==0);
%     data_X=data_X(1:min(zero_pos_y),:)
   
end
L_m_k_1= abs(data_X-circshift(data_X,1,2));
L_m_k_1(zero_pos_x,zero_pos_y)=0;
L_m_k_1(zero_pos_x2,zero_pos_y2)=0;
L_m_k_2=(sum(L_m_k_1(:,2:end),2)./k).*(N-1)./k./(length(data_X)-1);
FDD(k)=log(mean(L_m_k_2))./log(1./k);
clear data_X
end
kk=1:k;
% plot(kk,FDD,'-.')
% hold on
dd=mean(FDD(2:end-30))
