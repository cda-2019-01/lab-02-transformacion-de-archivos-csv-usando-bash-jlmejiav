sudo apt-get install -y csvki
ls estaciones > ListNombres.txt
cat $(echo estaciones/$(head -n 1 ListNombres.txt)) > out1.csv
csvstack -g $(echo $(cat ListNombres.txt) | tr ' ' ',') -n Estacion $(echo out1.csv $(printf 'estaciones/%s ' $(tail +2 ListNombres.txt))) > consolidado.csv
sed 's/,/;/' consolidado.csv | tr ',' '.' | tr ';' ',' > out2.csv
sed 's/FECHA/DIA,MES,ANO/' out2.csv | sed 's#\([0-9]*\)/\([0-9]*\)/\([0-9]\)#\1,\2,\3#' > out3.csv
csvsql --query 'select Estacion,DIA,avg(VEL) from out3 group by Estacion,DIA' out3.csv > velocidad-por-DIA.csv
csvsql --query 'select Estacion,MES,avg(VEL) from out3 group by Estacion,MES' out3.csv > velocidad-por-MES.csv
csvsql --query 'select Estacion,ANO,avg(VEL) from out3 group by Estacion,ANO' out3.csv > velocidad-por-ANO.csv
rm out*.csv
rm consolidado.csv