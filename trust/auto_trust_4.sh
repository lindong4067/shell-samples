#!/bin/bash
echo "Please select operation:"
echo "[0]   Quit:"
echo "[1]   Import IP:"
read num
if [[ $num == 0 ]];then
    echo "Goodbye!"
    exit 0
elif [[ $num == 1 ]];then
    echo "Start adding trust!"
fi
