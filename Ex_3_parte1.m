%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Exercício 3 - Parte 1                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
cd G:/fractal/dados
load pr_m

%Para comparação com a climatologia da chuva mensal nas bacias, é necessário
%primeiro transformar a chuva acumulada a cada 6 h em chuva mensal para os
%próximos nove meses

%dez 2021
m = month(t);
a = find(m == 12); dec = NaN(7,length(a));

for j = 1:length(a)
dec(:,j) = pr_m(:,a(j));
end

dec = sum(dec,2);

%jan 2022
a = find(m == 1); jan = NaN(7,length(a));

for j = 1:length(a)
jan(:,j) = pr_m(:,a(j));
end

jan = sum(jan,2);

%fev 2022
a = find(m == 2); fev = NaN(7,length(a));

for j = 1:length(a)
fev(:,j) = pr_m(:,a(j));
end

fev = sum(fev,2);

%mar 2022
a = find(m == 3); mar = NaN(7,length(a));

for j = 1:length(a)
mar(:,j) = pr_m(:,a(j));
end

mar = sum(mar,2);

%abr 2022
a = find(m == 4); abr = NaN(7,length(a));

for j = 1:length(a)
abr(:,j) = pr_m(:,a(j));
end

abr = sum(abr,2);

%mai 2022
a = find(m == 5); mai = NaN(7,length(a));

for j = 1:length(a)
mai(:,j) = pr_m(:,a(j));
end

mai = sum(mai,2);

%jun 2022
a = find(m == 6); jun = NaN(7,length(a));

for j = 1:length(a)
jun(:,j) = pr_m(:,a(j));
end

jun = sum(jun,2);

%jul 2022
a = find(m == 7); jul = NaN(7,length(a));

for j = 1:length(a)
jul(:,j) = pr_m(:,a(j));
end

jul = sum(jul,2);

%ago 2022
a = find(m == 8); ago = NaN(7,length(a));

for j = 1:length(a)
ago(:,j) = pr_m(:,a(j));
end

ago = sum(ago,2);

pr_mensal = cat(2,dec,jan,fev,mar,abr,mai,jun,jul,ago);
%bacias nas linhas e meses entre dec e ago nas colunas

cd G:/fractal/dados;
save('pr_mensal','pr_mensal');
cd G:/fractal/scripts;

