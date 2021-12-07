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

cp ../hoofdstukken/Voorwoord/*.* $build_folder;         mv $build_folder/README.md $build_folder/README_00.md
cp ../hoofdstukken/13_servo_serial/*.* $build_folder;   mv $build_folder/README.md $build_folder/README_01.md
cp ../hoofdstukken/14_servo_potmeter/*.* $build_folder; mv $build_folder/README.md $build_folder/README_02.md
cp ../hoofdstukken/15_servo_fsr/*.* $build_folder;  mv $build_folder/README.md $build_folder/README_03.md
cp ../hoofdstukken/16_servos/*.* $build_folder;         mv $build_folder/README.md $build_folder/README_04.md

cd $build_folder

cat README_00.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_01.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_02.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_03.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_04.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md

# Thinner margin
pandoc README.md -o boek.pdf --toc --toc-depth=1 --highlight-style=tango -V geometry:margin=0.5in

cp boek.pdf ../../boeken/boek_4_zonder_voorpagina.pdf

cd ../../boeken

pdfunite voorpagina_4.pdf boek_4_zonder_voorpagina.pdf boek_4.pdf

# Make booklet
bookletimposer -a boek_4.pdf -o boekje_4.pdf

# Cleanup
rm boek_4_zonder_voorpagina.pdf
