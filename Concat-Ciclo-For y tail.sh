cat $(echo estaciones/$(head -n 1 ListNombres.txt)) > completo2.csv
for n in $(tail +2 ListNombres.txt); do tail +2 estaciones/$n ; done >> completo2.csv