%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Exercícios 1 e 2                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path(path,'C:\Users\Laís\Desktop\tese\scripts\Plot');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_geral');
path(path,'C:\Users\Laís\Desktop\tese\scripts\toolbox_ocean');

clc
clear
cd G:/fractal/dados
ncdisp('prate.01.2021111406.daily.nc');

pr = ncread('prate.01.2021111406.daily.nc','PRATE_P0_L1_GGA0');   
lat = ncread('prate.01.2021111406.daily.nc','lat_0'); lat1 = lat;
lon = ncread('prate.01.2021111406.daily.nc','lon_0'); lon1 = lon;
[I,J,T] = size(pr);

time = ncread('prate.01.2021111406.daily.nc','forecast_time0'); 

%Converting precipitation flux (kg/m^2/s or mm/s) in mm/6hour:
%Multiplying by 21600s to calculate mm/6h
pr = reshape(pr,I*J,T);
for i = 1:T
    pr(:,i) = pr(:,i)*21600;
end
pr = reshape(pr,I,J,T);

%Exercicio 1---------------
%Plotting the total rainfall (mm/6h) for the second time step only in SA:
figure
south = -60 ; north = 20 ; west  = 275 ; east  = 330 ;
m_proj('equidistant cylindrical','lon',[west east],'lat',[south north]);
[x1,y1]=m_ll2xy(west,south);[x2,y2]=m_ll2xy(east,north);
[lon,lat]= meshgrid(lon1,lat1);[x,y]=m_ll2xy(lon,lat);
pcolor(x,y,pr(:,:,2)'); shading interp; hold on;
cmin=0; cmax=16; maplength = 2; caxis([cmin cmax])
map = [1 1 1
    0.9 0.9 0.9
    0.7 0.7 0.7
    0.27 0.95 0.93 %fluorescent blue
    0.53 0.81 0.94 %baby blue
    0.27 0.56 0.92 %chefchaouen blue
    0 0 1
    0 0 0.55]; %dark blue
colormap(map); 
axis([x1 x2 y1 y2]); hold on; set(gca,'Fontsize',12)
m_coast('color','k','linewidth',1.5)
m_grid_global('',3,9);
title('Prec acumulada em 6h - 14/11/21 - 12Z','Fontsize',16,'visible','on','fontweight','bold');

%Colorbar
h = colorbar('Position',[ 0.77 0.32 0.018 0.42 ]);
cmin=0; cmax=16; 
set( h,'XLim',[cmin cmax],'xtick',[0:2:14]);

%Exercicio 2----------------
%Lendo o arquivo das bacias
cd G:/fractal/bacias_cfs

%Bacia do Uruguai-----------------------------
U = shaperead('bacia_do_uruguai.shp');
%a lon está negativa, sendo necessário subtrair o valor de 360
U_coords = U.BoundingBox;

%Calculando a chuva média prevista para a área da bacia em cada passo de
%tempo:
pr_U = pr(324:329,126:128,:);
pr_Um = nanmean(pr_U,2); pr_Um = squeeze(pr_Um); pr_Um = nanmean(pr_Um,1);
%---------------------------------------------

%Bacia do Tocantins-----------------------------
T = shaperead('bacia_do_tocantins.shp');
%a lon está negativa, sendo necessário subtrair o valor de 360
T_coords = T.BoundingBox;

%Calculando a chuva média prevista para a área da bacia em cada passo de
%tempo:
pr_T = pr(326:337,97:115,:);
pr_Tm = nanmean(pr_T,2); pr_Tm = squeeze(pr_Tm); pr_Tm = nanmean(pr_Tm,1);
%----------------------------------------------

%Bacia do Tiete-----------------------------
Ti = shaperead('bacia_do_tiete.shp');
%a lon está negativa, sendo necessário subtrair o valor de 360
Ti_coords = Ti.BoundingBox;

%Calculando a chuva média prevista para a área da bacia em cada passo de
%tempo:
pr_Ti = pr(330:337,117:121,:);
pr_Tim = nanmean(pr_Ti,2); pr_Tim = squeeze(pr_Tim); pr_Tim = nanmean(pr_Tim,1);
%----------------------------------------------

%Bacia do Paranapanema-----------------------------
P = shaperead('bacia_do_paranapanema.shp');
%a lon está negativa, sendo necessário subtrair o valor de 360
P_coords = P.BoundingBox;

%Calculando a chuva média prevista para a área da bacia em cada passo de
%tempo:
pr_P = pr(328:334,119:123,:);
pr_Pm = nanmean(pr_P,2); pr_Pm = squeeze(pr_Pm); pr_Pm = nanmean(pr_Pm,1);
%----------------------------------------------

%Bacia do Iguacu-----------------------------
I = shaperead('bacia_do_iguacu.shp');
%a lon está negativa, sendo necessário subtrair o valor de 360
I_coords = I.BoundingBox;

%Calculando a chuva média prevista para a área da bacia em cada passo de
%tempo:
pr_I = pr(327:333,121:124,:);
pr_Im = nanmean(pr_I,2); pr_Im = squeeze(pr_Im); pr_Im = nanmean(pr_Im,1);
%----------------------------------------------

%Bacia do Grande-----------------------------
G = shaperead('bacia_do_grande.shp');
%a lon está negativa, sendo necessário subtrair o valor de 360
G_coords = G.BoundingBox;

%Calculando a chuva média prevista para a área da bacia em cada passo de
%tempo:
pr_G = pr(330:339,116:120,:);
pr_Gm = nanmean(pr_G,2); pr_Gm = squeeze(pr_Gm); pr_Gm = nanmean(pr_Gm,1);
%----------------------------------------------

%Bacia do Amazonas-----------------------------
A = shaperead('bacia_do_amazonas.shp');
%a lon está negativa, sendo necessário subtrair o valor de 360
A_coords = A.BoundingBox;

%Calculando a chuva média prevista para a área da bacia em cada passo de
%tempo:
pr_A = pr(307:333,90:113,:);
pr_Am = nanmean(pr_A,2); pr_Am = squeeze(pr_Am); pr_Am = nanmean(pr_Am,1);
%----------------------------------------------
%Criando uma coordenada de tempo para o eixo x: 
t1 = datetime(2021,11,14,6,0,0);%data inicial
t2 = datetime(2022,8,31,18,0,0);%data final
t = t1:hours(6):t2;%serie temporal com intervalo de 6h

%MAIN PLOT:
figure
subplot(2,1,1)
h1 = plot(t,pr_Um,'r-','LineWidth',0.5);
hold on
h3 = plot(t,pr_Tim,'k-','LineWidth',0.5);
hold on
h4 = plot(t,pr_Pm,'g-','LineWidth',0.5);
hold on
h5 = plot(t,pr_Im,'m-','LineWidth',0.5);
hold on
h6 = plot(t,pr_Gm,'c-','LineWidth',0.5);
hold on
title('Precipitação acumulada em 6h na Bacia do Prata (14/11/21 a 31/08/22)','FontSize',14);
ylabel('Prec (mm/6h)','FontSize',14);
ylim([0 25]);
set(gca,'FontSize',14)
yticks([0:5:25]);
ax = gca;
ax.XAxis.Limits = [t1,t2];
ax = gca;
ax.XAxis.TickValues = [t(69) t(317) t(553) t(797) t(1041)];
hold on
legend({'Uruguai','Tiete','Paranapanema','Iguacu','Rio Grande'},'Orientation','horizontal','Location','southoutside','FontSize',12);

subplot(2,1,2)
h2 = plot(t,pr_Tm,'b-','LineWidth',0.5);
hold on
h7 = plot(t,pr_Am,'-','Color',[0.5 0.5 0.5],'LineWidth',0.5);
hold on
title('Prec acumulada em 6h nas Bacias do Norte (14/11/21 a 31/08/22)','FontSize',14);
xlabel('Tempo','FontSize',14);
ylabel('Prec (mm/6h)','FontSize',14);
ylim([0 10]);
set(gca,'FontSize',14)
yticks([0:5:10]);
ax = gca;
ax.XAxis.Limits = [t1,t2];
ax = gca;
ax.XAxis.TickValues = [t(69) t(317) t(553) t(797) t(1041)];
hold on
legend({'Tocantins','Amazonas'},'Orientation','horizontal','Location','southoutside','FontSize',12);

pr_m = cat(1,pr_Am,pr_Gm,pr_Im,pr_Pm,pr_Tim,pr_Tm,pr_Um);

cd G:/fractal/dados;
save('pr_m','pr_m','t','t1','t2','-v7.3');
cd G:/fractal/scripts;


