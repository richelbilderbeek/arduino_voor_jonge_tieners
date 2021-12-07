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

cp ../hoofdstukken/Voorwoord/*.* $build_folder        ; mv $build_folder/README.md $build_folder/README_00.md
cp ../hoofdstukken/05_blink_4/*.* $build_folder       ; mv $build_folder/README.md $build_folder/README_01.md
cp ../hoofdstukken/06_oplaadknop/*.* $build_folder    ; mv $build_folder/README.md $build_folder/README_02.md
cp ../hoofdstukken/07_potmeter_en_joystick/*.* $build_folder; mv $build_folder/README.md $build_folder/README_03.md
cp ../hoofdstukken/08_ldr/*.* $build_folder     ; mv $build_folder/README.md $build_folder/README_04.md

cd $build_folder

cat README_00.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_01.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_02.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md
cat README_03.md >> README.md; echo " " >> README.md; echo "\pagebreak" >> README.md; echo " " >> README.md

# Thinner margin
pandoc README.md -o boek.pdf --toc --toc-depth=1 --highlight-style=tango -V geometry:margin=0.5in

cp boek.pdf ../../boeken/boek_2_zonder_voorpagina.pdf

cd ../../boeken
pdfunite voorpagina_2.pdf boek_2_zonder_voorpagina.pdf boek_2.pdf

# Make booklet
bookletimposer -a boek_2.pdf -o boekje_2.pdf

# Cleanup
rm boek_2_zonder_voorpagina.pdf
