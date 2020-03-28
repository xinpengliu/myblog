#!/bin/bash

filename=word.pdf
page_perday=10


pages=`qpdf --show-npages $filename`
echo pages:${pages}

for ((i=1; page_perday*(i-1)<=${pages}; i++)) 
do
    let "p1=page_perday * i - 9";
    let "p2=page_perday * i";
    if (( $p2 > ${pages} ))
    then
        let p2=pages;
    fi
 #  echo "qpdf --pages $filename $p1-$p2 -- ${filename} task_day${i}_${filename};"
   qpdf --pages $filename $p1-$p2 -- ${filename} task_day${i}_${filename};
done


echo Finish this task need $((i-1))  days!
