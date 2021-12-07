#!/bin/bash

# Concatenate all Markdown files first, convert those to one PDF

build_folder=build
#echo $build_folder

rm -rf build
mkdir build

if [ ! -d $build_folder ]; then 
  echo "Error: failed to create build folder"
  exit 1
fi

cp ../hoofdstukken/voorpagina/*.* $build_folder
cd $build_folder

pandoc voorpagina_1.md -o ../../boeken/voorpagina_1.pdf
pandoc voorpagina_2.md -o ../../boeken/voorpagina_2.pdf
pandoc voorpagina_3.md -o ../../boeken/voorpagina_3.pdf
pandoc voorpagina_4.md -o ../../boeken/voorpagina_4.pdf
pandoc voorpagina_5.md -o ../../boeken/voorpagina_5.pdf
pandoc voorpagina_6.md -o ../../boeken/voorpagina_6.pdf
pandoc voorpagina_7.md -o ../../boeken/voorpagina_7.pdf


