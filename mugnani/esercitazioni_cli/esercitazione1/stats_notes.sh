#!/bin/bash

echo "Categorie: $(ls output/notes | wc -l)
" >output/$1.txt

echo $(wc -l output/notes/*.txt 2>/dev/null | grep -v total) >>output/$1.txt

echo "Inserisci un commento:"
read cmt
echo "
$cmt" >>output/$1.txt

echo "$1.txt è stato creato"
