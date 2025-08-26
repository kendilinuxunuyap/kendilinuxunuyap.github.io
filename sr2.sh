#!/bin/bash
#sudo apt install librsvg2-*
#sudo apt install pandoc
directory="$1"

for i in $(find $directory -type f -name \*.rst|sort)
do

if [  $(basename $i) == "index.rst" ]; then
	cat $i|head -n 3 >>temp.rst
	echo "">>temp.rst
fi

if [  $(basename $i) != "index.rst" ]; then
	cat $i>>temp.rst
	echo "">>temp.rst
fi


done
pandoc temp.rst -o kitap.docx
rst2pdf wiki/index.rst -o build/output.pdf
