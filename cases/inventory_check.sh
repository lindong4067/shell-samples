#!/bin/bash

usage() {
    echo "Usage:"
    echo ""
    echo "    ine_check.sh [resource path]"
    echo ""
    echo "For example:"
    echo ""
    echo "    ine_check.sh /export/CM/20220819"
    echo ""
}

folderNotExist() {
    echo ""
    echo "Folder not exist, please check it!"
    echo ""
}

clearxmlfiles() {
    cd $1
    for file in $(ls | grep .xml | grep -v .zip)
    do
        rm -rf $file
    done
}

unzipfiles() {
    cd $1
    for file in $(ls | grep .zip)
    do
        unzip $file > /dev/null 2>&1
    done

}

printtitle(){
    title=""
    column_count=0
    for column in "$@"
    do
      title+="|$column$separation"
      let column_count++
    done
    title+="|\n"
    echo $title
}

printsegment(){
    seg=""
    for i in $(seq $column_count)
    do
      seg+="+$separation"
    done
    seg+="+\n"
    echo $seg
}

inventorycheck() {
    cd $1
    echo ""
    echo "        INVENTORY SUMMARY"
    echo "+----------+----------+----------+"
    echo "|TIME      |INVENTORY |NUMBER    |"
    echo "+----------+----------+----------+"
    for file in $(ls | grep .xml | grep -v .zip)
    do    
        echo "+----------+----------+----------+"
        tim=$(echo $file | sed 's/CM-PON-\([A-Z]*\)-\([0-9]*\)-\(V[0-9.]*\)-\([0-9]*\)0000.*/\4/g')
        inv=$(echo $file | sed 's/CM-PON-\([A-Z]*\)-.*/\1/g')
        num=$(grep -o "<Object rmUID=" $file | wc -l)
        printf "|%-10s|%-10s|%-10s|\n" $tim $inv $num
    done 
    echo "+----------+----------+----------+"
}

## main ##


if [[ "$#" -eq 0 ]]
then
    usage >&2
    exit 1
fi

if [[ ! -d "$1" ]]
then
    folderNotExist >&2
    usage >&2
    exit 1
fi


clearxmlfiles $1

unzipfiles $1

inventorycheck $1

clearxmlfiles $1



