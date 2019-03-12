titlechar='ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789-';

result='FOODMOOTHAMPIECAKETUNAZYGOT4567'
result='CATDOGFISHWATERBOWLHATHATGLOVESHOESFISHRAT';
fprintf(1, 'Predicted character is: \n' )
X_CJ2=[];
Y_CJ2=[];
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
        X_CJ2=[X_CJ2,x];
        Y_CJ2=[Y_CJ2,y];
                 fprintf('    ')
                if (mod(i,4)==0)
                 fprintf('     \n')
                end
    
end
X_CJ2
Y_CJ2
save(['E:/BCI_IIdata/data/CJ_oricode.mat'],'X_CJ2','Y_CJ2')%%%%%%ÐÐ156£¬64ÁÐ,540¸ö×Ö·û

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


fprintf(1, '\n Predicted character is: \n' )
succ=0;
for coni=1:length(yfit)/14/12
    xx=[];
    yy=[];
    pos2=find(yfit(1+168*(coni-1):168*(coni))==1);
    fin_pos_p=StimulusCode_test(pos2);
%     plot(yfit(1+168*(coni-1):168*(coni)),'p')
    for i=1:length(fin_pos_p)
    if (fin_pos_p(i)>6)
        yy=[yy,fin_pos_p(i)];
    end
    if (fin_pos_p(i)<=6)
        xx=[xx,fin_pos_p(i)];
    end
    
    end
    if length(yy)>1
    yy_m=round(mean(yy(1:length(yy)-1)));
%       yy_m=7;
    else
        yy_m=round(mean(yy));
    end
    if length(xx)>1
    xx_m=round(mean(xx(1:length(xx)-1)));
%       xx_m=1;
    else
        xx_m=round(mean(xx));
    end
    fprintf(1, '%c', titlechar(xx_m+(yy_m-6-1)*6));
    if titlechar(xx_m+(yy_m-6-1)*6)==result(coni)
        succ=succ+1;
    end
end
 fprintf('     \n')
fprintf( '%c', result);
succ

% 
% 
% for i=1:length(fin_pos)
%     if (fin_pos(i)>6)
%         yy=[yy,fin_pos(i)];
%     end
%     if (fin_pos(i)<=6)
%         xx=[xx,fin_pos(i)];
%     end
%         
% end
%     
% for i=1:length(xx)
%     
%       fprintf(1, '%c', titlechar(xx(i)+(yy(i)-6-1)*6));
%              
%        sum=sum+1;
%        
%    
%       if (mod(i,30)==0)
%                  fprintf('    ')
%       end
%       if (mod(i,120)==0)
%                  fprintf('     \n')
%       end
% end
% sum

