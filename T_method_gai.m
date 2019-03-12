%% 最大似然法 取最值


A_sce=M_sce(:,1).*SCE_1;
A_sce0=M_sce0(:,1).*SCE0_1;
figure
plot(max(A_sce),'.')
hold on
plot(max(A_sce0),'.')

A_sce=M_sce0(:,1).*SCE_1;
A_sce0=M_sce(:,1).*SCE0_1;

plot(max(A_sce),'.')
hold on
plot(max(A_sce0),'.')
legend


%% 取加权和
A_sce=M_sce(:,1)'*SCE_1;
A_sce0=M_sce0(:,1)'*SCE0_1;
figure
plot((A_sce),'.')
hold on
plot((A_sce0),'.')

A_sce=M_sce0(:,1)'*SCE_1;
A_sce0=M_sce(:,1)'*SCE0_1;

plot((A_sce),'.') 
hold on
plot((A_sce0),'.')
legend