#!/bin/bash

QUIT=quit
until [ "$INPUT" = "$QUIT" ]
do
  echo "Please input command: "
  echo "(type command $QUIT_COMMAND to exit)"
  read INPUT
  echo 
  echo ">>your command is $INPUT"
  
  case $INPUT in
    "open")
      echo ">>opening...."
      ;;
    "close")
      echo ">>closing...."
      ;;
    *)
      echo ">>unknown command"
      ;;
  esac
echo
done
echo "Bye~"
exit 0

