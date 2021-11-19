1) Como encontrar os dados de previsão de precipitação a cada 6 horas do modelo CFSv2:

Acesse o site: https://www.ncei.noaa.gov/access/metadata/landing-page/bin/iso?id=gov.noaa.ncdc:C00877

Clique em Products --> Weather and Climate Models --> Numerical Weather Prediction --> 
Climate Forescat System --> Operational --> CFSv2 Operational Forecasts --> 
escolha 9-Month Forecasts: Time Series (opção https) --> selecione ano, mês, data e hora da previsão inicial-->
Faça o download do arquivo grib2 para o seu PC

2) Lendo os arquivo grib2 no Python

Para ler  arquivo grib2 no Python eu tive que instalar as seguintes dependencias via conda digitando os seguintes 
comandos no terminal:

> conda install -c anaconda xarray

> conda install -c conda-forge pynio

> conda install -c anaconda pandas

Eu criei o script grib_prec_CFS2.py para ler o arquivo com extensão grib2 e tranformá-lo em extensão netCDF, 
pois eu estou mais familiarizada com arquivos deste tipo. No entanto, quando eu tentei dar cotinuidade com a 
análise de dados no Python (com o script grib_prec_CFS3.py) eu enfrentei dificuldades em trabalhar com dados em escala 
temporal horária utilizando a biblioteca iris, a qual eu estou mais familiarizada em trabalhar no Python. 
Infelizmente as minhas análises anteriores em Python foram em dados em escala diária. Eu não tenho 
familiaridade com as funções para manipulação de data dentro do matplotlib. No entanto, se eu ver scripts prontos lidando 
com esses dados, posso aprender isso rapidamente e sozinha. Sendo assim, as análises estatísticas dos dados
foram feitas lendo os dados em extensão netCDF no MATLAB.

3) A ordem das análises nos scripts em Matlab segue a seguinte ordem nos scripts:
Exs_1_2.m
Ex_3_parte1.m
Ex_3_parte2.m



