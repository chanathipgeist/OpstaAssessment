#!/bin/bash

randomstring=????????????????????/  # 20 question marks, 1 slash (folders)
set -e                              # exit on error to be on the safe side

for i in {1..20};do
[ -d $randomstring ] ||             # do next line unless directory exists
randomstring=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
mkdir -p ./tests/$randomstring
randomfile=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1)
touch ./tests/$randomstring/$randomfile
done
