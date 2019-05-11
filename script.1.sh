ls estaciones > ListNombres.txt
cat $(echo estaciones/$(head -n 1 ListNombres.txt)) > consolidado.csv
csvstack -g $(echo $(cat ListNombres.txt) | tr ' ' ',') -n Estacion consolidado.csv $(printf 'estaciones/%s ' $(tail +2 ListNombres.txt)) > consolidado.csv
sed 's/\(E[0-9]\),/\1;/' consolidado.csv | tr ',' '.' | tr ';' ',' > out.1