ls estaciones > ListNombres.txt
csvstack -g $(echo $(cat ListNombres.txt) | tr ' ' ',') -n Estacion $(printf 'estaciones/%s ' $(cat ListNombres.txt)) > consolidado.csv
sed 's/\(E[0-9]\),/\1;/' consolidado.csv | tr ',' '.' | tr ';' ',' > out.1