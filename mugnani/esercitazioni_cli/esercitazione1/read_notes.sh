#!/bin/bash

echo "Stampo la lista delle note:"
ls output/notes/ | cut -d . -f 1

echo "
Quale nota vuoi leggere?"
read nota
cat output/notes/$nota.txt
