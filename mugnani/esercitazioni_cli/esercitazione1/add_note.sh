#!/bin/bash

echo "Inserisci il contenuto della nota:"

read contenuto

echo $contenuto >>output/notes/$1.txt

echo "$1.txt creato"
