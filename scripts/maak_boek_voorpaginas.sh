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

pandoc voorpagina_1_led.md -o ../../boeken/voorpagina_1_led.pdf
pandoc voorpagina_2_leds.md -o ../../boeken/voorpagina_2_leds.pdf
#pandoc VoorpaginaActuatorenLaag.md -o ../../boeken/VoorpaginaActuatorenLaag.pdf
#pandoc VoorpaginaActuatorenHoog.md -o ../../boeken/VoorpaginaActuatorenHoog.pdf
#pandoc VoorpaginaMuziek.md -o ../../boeken/VoorpaginaMuziek.pdf
#pandoc VoorpaginaNeoPixel.md -o ../../boeken/VoorpaginaNeoPixel.pdf
#pandoc VoorpaginaTheremin.md -o ../../boeken/VoorpaginaTheremin.pdf


