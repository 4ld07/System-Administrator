#!/bin/bash

#echo "Scrivi una parola da escludere:"
#read stp

echo "Top $1 parole contenute nelle note">output/top-$1.txt
# tr alternativa a sed: tr -c 'a-zA-Z' '\n'
# -c=complemento cioè tutto il resto
cat output/notes/*.txt \
    | sed s/[^a-zA-Z]/"\n"/g \
    | sort \
    | uniq -c \
    | sort -n \
    | head -n $1 >>output/top-$1.txt

echo "Report creato in output/top-$1.txt"
