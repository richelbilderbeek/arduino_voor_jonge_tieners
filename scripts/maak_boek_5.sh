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

cp ../hoofdstukken/Voorwoord/*.* $build_folder                              ; mv $build_folder/README.md $build_folder/README_00.md
cp ../hoofdstukken/17_simpele_melodie/*.* $build_folder                     ; mv $build_folder/README.md $build_folder/README_01.md
cp ../hoofdstukken/18_7_pin_piano/*.* $build_folder                         ; mv $build_folder/README.md $build_folder/README_02.md
cp ../hoofdstukken/19_1_pin_7_parallelle_weerstanden_piano/*.* $build_folder; mv $build_folder/README.md $build_folder/README_03.md
cp ../hoofdstukken/20_1_pin_7_weerstanden_in_serie_piano/*.* $build_folder  ; mv $build_folder/README.md $build_folder/README_04.md

cd $build_folder

cat README_00.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_01.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_02.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_03.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_04.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md

# Table of Content
# Code has highlights following the tango color scheme
# Thinner margin of 0.5 inch
# Do not cut code blocks
pandoc README.md -o boek.pdf --toc --toc-depth=1 --highlight-style=tango -V geometry:margin=0.5in

cp boek.pdf ../../boeken/boek_5_zonder_voorpagina.pdf

cd ../../boeken
pdfunite voorpagina_5.pdf boek_5_zonder_voorpagina.pdf boek_5.pdf

# Make booklet
bookletimposer -a boek_5.pdf -o boekje_5.pdf

# Cleanup
rm boek_5_zonder_voorpagina.pdf
