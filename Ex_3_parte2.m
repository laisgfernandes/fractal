%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        Exercício 3 - Parte 2                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
cd G:/fractal/dados
load pr_mensal%dados da previsao do CFS

%dados de prec das bacias para climatologia
load chuva_CFS_uruguai.txt; load chuva_CFS_tocantins.txt;
load chuva_CFS_paranapanema.txt; load chuva_CFS_iguacu.txt;
load chuva_CFS_tiete.txt; load chuva_CFS_grande.txt,
load chuva_CFS_amazonia.txt

%tirando o primeiro e o último ano com dados inconsistentes (iguais a zero):
A = chuva_CFS_amazonia(:,2:end-1); G = chuva_CFS_grande(:,2:end-1);
Ti = chuva_CFS_tiete(:,2:end-1); T = chuva_CFS_tocantins(:,2:end-1); 
U = chuva_CFS_uruguai(:,2:end-1); I = chuva_CFS_iguacu(:,2:end-1);
P = chuva_CFS_paranapanema(:,2:end-1);

%calculando a precipitacao mensal media ao longo dos 42 anos:
A = nanmean(A,2); I = nanmean(I,2);
G = nanmean(G,2); P = nanmean(P,2);
T = nanmean(T,2); Ti = nanmean(Ti,2);
U = nanmean(U,2);

%juntando os dados das bacias na mesma ordem do arquivo pr_mensal:
pr_clim = cat(2,A,G,I,P,Ti,T,U); pr_clim = pr_clim';
%bacias nas linhas e 

%arrumando os meses na clim para iniciar em dez e terminar em ago:
pr_clim = [pr_clim(:,12) pr_clim(:,1:8)];

%calculando a dif entre a prev e a clim:
dif = pr_mensal - pr_clim;

%grafico para mostrar a diff entre a prev de chuva acumulada mensal e a
%climatologia em cada bacia:
x = 1:9;
figure
h = bar(x,dif');
hold on
h(1).FaceColor = [0.5 0.5 0.5];
h(2).FaceColor = 'c';
h(3).FaceColor = 'm';
h(4).FaceColor = 'g';
h(5).FaceColor = 'k';
h(6).FaceColor = 'b';
h(7).FaceColor = 'r';
hold on
title('Anomalias de precipitação mensal','FontSize',14);
ylabel('Anomalias (mm/mês)','FontSize',14);
ylim([-200 200]);
set(gca,'FontSize',14)
yticks([-200:50:200]);
xticks([1:9]);
xticklabels({'Dez','Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago'});
xlim([0 10]);
hold on
legend({'Amazonas','Rio Grande','Iguaçu','Paranapanema','Tiete','Tocatins','Uruguai'},'Orientation','horizontal','Location','southoutside','FontSize',12);

%Calculando a diferença percentual entre a prev e a clim:
x = pr_mensal



