ls estaciones > ListNombres.txt
cat $(echo estaciones/$(head -n 1 ListNombres.txt)) > out1.csv
csvstack -g $(echo $(cat ListNombres.txt) | tr ' ' ',') -n Estacion $(echo out1.csv $(printf 'estaciones/%s ' $(tail +2 ListNombres.txt))) > consolidado.csv
sed 's/,/;/' consolidado.csv | tr ',' '.' | tr ';' ',' > out2.csv
sudo apt-get install -y csvkit
csvsql --query 'select Estacion,FECHA,VEL from out2.csv group by Estacion' out2.csv > out3.csv