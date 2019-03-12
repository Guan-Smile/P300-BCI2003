titlechar='ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789-';

result='FOODMOOTHAMPIECAKETUNAZYGOT4567'
fprintf(1, 'Predicted character is: \n' )
for i=1:length(result)
    ccc=find(titlechar==result(i));
        x=mod(ccc,6);
    if (x==0)
        x=6;
    end
    y=fix(ccc/6.1)+7;
%      if (y==7)
%         x=6;
%     end
    %     fprintf(1, 'Predicted CODE is: %d, %d \n', x,y);
%     fprintf(1, 'Predicted character is: \n' )
    for tt=1:15
    fprintf(1, '%c', titlechar(x+(y-6-1)*6));
    end
                 fprintf('    ')
                if (mod(i,4)==0)
                 fprintf('     \n')
                end
    
end
%%
% x=zeros(length(fin_pos),1);
% y=zeros(length(fin_pos),1);
% 
% for i=1:length(fin_pos)
%     
%     if (fin_pos(i)>6)
%         y(i)=fin_pos(i);
%     else if (fin_pos(i)<=6)
%             x(i)=fin_pos(i);
%         end
%     end    
% end
%% 
%  

% % % % pos2=find(yfit==1);
% % % % 
% % % % diff=find(pos-pos2~=0);
% % % % % load('Z_test_all.mat')
% 
% pos=find(y_train==1);
% fin_pos=StimulusCode_train(pos);

sum=1;
fprintf(1, '\n Predicted character is: \n' )
xx=[];
yy=[];

for i=1:length(fin_pos)
    if (fin_pos(i)>6)
        yy=[yy,fin_pos(i)];
    end
    if (fin_pos(i)<=6)
        xx=[xx,fin_pos(i)];
    end
        
end
    
for i=1:length(xx)
    
      fprintf(1, '%c', titlechar(xx(i)+(yy(i)-6-1)*6));
             
       sum=sum+1;
       
   
      if (mod(i,30)==0)
                 fprintf('    ')
      end
      if (mod(i,120)==0)
                 fprintf('     \n')
      end
end
sum

