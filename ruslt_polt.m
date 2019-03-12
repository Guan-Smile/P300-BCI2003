%% plot
zuobiao = 4:15;
succ_com=reshape(SUC_ALL,12,[]);
plot(zuobiao,31*succ_com(:,1:2),'-P');
hold on
plot(zuobiao,31*succ_com(:,3:4),'-o');
plot(zuobiao,31*succ_com(:,5:6),'-*');

legend('分类器esd，T权值old','分类器esd，T权值new','分类器15，T权值old','15，T权值new'...
    ,'分类器15，T权值new，新判别法','15，T权值old，新判别法','Location','southeast')
axis([4,15,0,31])
title('符号识别准确度')
xlabel('BLOCK块平均个数')
ylabel('正确个数')
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
 title('15次数据全部使用时符号识别准确度')
xlabel('每次平均数据块的个数')
ylabel('正确个数')
grid on
legend('BLOCK=14时分类器判别准确率','BLOCK=14时原始方法优化后判别准确率',...
    'BLOCK=14时原始方法判别准确率','Location','southeast')



