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

cp ../hoofdstukken/Voorwoord/*.* $build_folder            ; mv $build_folder/README.md $build_folder/README_00.md
cp ../hoofdstukken/21_theremin_potmeters/*.* $build_folder; mv $build_folder/README.md $build_folder/README_01.md
cp ../hoofdstukken/22_theremin_ldr/*.* $build_folder      ; mv $build_folder/README.md $build_folder/README_02.md
cp ../hoofdstukken/23_theremin_infrarood/*.* $build_folder; mv $build_folder/README.md $build_folder/README_03.md
cp ../hoofdstukken/24_theremin_joystick/*.* $build_folder ; mv $build_folder/README.md $build_folder/README_04.md

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

cp boek.pdf ../../boeken/boek_6_zonder_voorpagina.pdf

cd ../../boeken
pdfunite VoorpaginaTheremin.pdf boek_6_zonder_voorpagina.pdf boek_6.pdf

# Make booklet
bookletimposer -a boek_6.pdf -o boekje_6.pdf

# Cleanup
rm boek_6_zonder_voorpagina.pdf
