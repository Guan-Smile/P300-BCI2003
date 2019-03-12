function [chr] = wordshow(pos)

max_stimuluscode=12;
titlechar='ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789-';


result='FOODMOOTHAMPIECAKETUNAZYG0T4567'


x=cur_x;
y=cur_y;
% h=subplot(6, 6, x+(y-1)*6);
% hold on;
% avgresponse=mean(stimulusdata([x (y-1)+7], :), 1); 
% cur_response=avgresponse(classtime);
% plot(classtimems, cur_response, 'ro');
fprintf(1, 'Predicted character is: %c\n', titlechar(x+(y-1)*6));
fprintf(1, '(we make no statement about whether this prediction is correct or not - this is just an example)\n');
fprintf(1, 'DONE !!\n');