#!/bin/bash

msg="c'est moi"
echo $msg

echo "pwd : $PWD"
echo "pwd : `pwd`"

let "a = 5"
let "b = 2"
let "c = b%a"
echo $c

read -s -n 15 -t 10 -p "full name : " first last 
echo -e "\n$first $last"

echo "$# param"

tbl=("val0" "val1")
echo "first carac : ${tbl[0]}"
tbl[2]="val2"
echo "all carac : ${tbl[*]}"

if [ 1 -lt 2 ]; then
    echo "1 is less than 2"
fi
if [ -d $PWD ] && [ -f bash_summary.sh ]; then
    echo "`pwd` is a repertory"
else
    echo "impossible"
fi

function createfiles
{
    for i in {1..3};
    do
        > $i.txt
    done
}

createfiles

if [ ! -z "$1" ]
then
    echo "no param expected"
    exit 1
else
    comp=".txt"
    echo "expected file type : '$comp'"
    for file in *
    do
        echo "$file"
        #if [ "${file##*.}" = "$comp" ]
        if [[ $file =~ "$comp"$ ]]
        then
            echo "$file correponds to the expected the '$comp' file type"
            rm "$file"
        else
            echo "$file doesn't correpond to the expected the '$comp' file type"
        fi
    done 
fi
 

