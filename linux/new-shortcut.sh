#!/bin/bash

function geticon() {
  FILENAME=$1
  ICON=$(gvfs-info $FILENAME -a "standard::icon" | tail -1 | awk 'BEGIN{ FS=": "}{print $2}' | cut -d"," -f2)
  echo $ICON
}

NAME=$(zenity --entry --text="Give this shortcut a name")
if [ -z "$NAME" ]
then
  zenity --error --text="You did not type in a name. Please open the script again."
  exit 1
fi

CHOICE=$(zenity --list --text="What type of shortcut would you like?" --column="" File Folder --hide-header)
if [ -z "$CHOICE"]
then
  zenity --error --text="You did not select something. Please open the script again."
  exit 1
fi

SHORTCUT_PATH="$HOME/Desktop/$NAME.desktop"

case $CHOICE in
"File")

  # File
  zenity ---info --text="Please choose a file"
  FILENAME=$(zenity --file-selection --text="Give me the filename")
  if [ -z "$FILENAME"]
  then
    zenity --error --text="You did not type in a filename. Please open the script again."
    exit 1
  fi
  # Gets icon of folder |
  # returns 2nd line |
  # and returns the 2nd column at the ": " string.
  ICON=$(geticon $FILENAME)
  echo -en "[Desktop Entry]\nType=Link\nName=$NAME\nURL=$FILENAME\nIcon=$ICON\n" > "$SHORTCUT_PATH"

  ;;
"Folder")

  # Folder
  zenity ---info --text="Please choose a folder"
  FILENAME=$(zenity --file-selection --text="Give me the filename" --directory)
  if [ -z "$FILENAME"]
  then
    zenity --error --text="You did not type in a filename. Please open the script again."
    exit 1
  fi
  # Gets icon of folder |
  # returns 2nd line |
  # and returns the 2nd column at the ": " string.
  ICON=$(geticon $FILENAME)
  echo -en "[Desktop Entry]\nType=Link\nName=$NAME\nURL=$FILENAME\nIcon=$ICON\n" > "$SHORTCUT_PATH"

  ;;
esac
