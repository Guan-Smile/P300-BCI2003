%% plot
zuobiao = 4:15;
succ_com=reshape(SUC_ALL,12,[]);
plot(zuobiao,31*succ_com(:,1:2),'-P');
hold on
plot(zuobiao,31*succ_com(:,3:4),'-o');
plot(zuobiao,31*succ_com(:,5:6),'-*');

legend('������esd��TȨֵold','������esd��TȨֵnew','������15��TȨֵold','15��TȨֵnew'...
    ,'������15��TȨֵnew�����б�','15��TȨֵold�����б�','Location','southeast')
axis([4,15,0,31])
title('����ʶ��׼ȷ��')
xlabel('BLOCK��ƽ������')
ylabel('��ȷ����')
grid on


%% try
% 
% 
% for I=1:size(CJ2_data,1)
%       plot(CJ2_data(I,:),'p') 
%        drawnow
% end
  
for I=1:size(CJ2_data_test,1)
      plot(CJ2_data_test(I,:),'p') 
       drawnow
       
end
  

%% trry CJ2 plot
suc_ori=[0.97 	0.90 	0.90 	0.94 	0.97 	1.00 	0.94 	0.90 	1.00 	1.00 	1.00 	1.00];
suc_ori_2=[0.84 	0.81 	0.90 	0.94 	0.97 	0.97 	0.90 	0.90 	0.97 	1.00 	1.00 	0.94];
 plot(3:14,SUC_ALL*31,'-p')
 hold on
 plot(3:14,suc_ori*31,'-o')
 plot(3:14,suc_ori_2*31,'->')
 title('15������ȫ��ʹ��ʱ����ʶ��׼ȷ��')
xlabel('ÿ��ƽ�����ݿ�ĸ���')
ylabel('��ȷ����')
grid on
legend('BLOCK=14ʱ�������б�׼ȷ��','BLOCK=14ʱԭʼ�����Ż����б�׼ȷ��',...
    'BLOCK=14ʱԭʼ�����б�׼ȷ��','Location','southeast')



