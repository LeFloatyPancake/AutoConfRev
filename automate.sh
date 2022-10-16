#!/bin/bash

HEIGHT=10
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Revanced: Continuing the Legacy of Vanced"
TITLE="Revanced Builder"
MENU="Select item to build:"

OPTIONS=(1 "Youtube"
         2 "Youtube Music")

CHOICE=$(dialog --colors --clear --no-shadow \
                --backtitle "\Zb\Z3$BACKTITLE" \
                --title "\Z0$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty) \

clear
case $CHOICE in
        1)
            echo -e "\e[1;35mBuilding Youtube\e[0m"
            echo
            ./delete.sh
            find ./stock -name '*.youtube_*' \
            -exec cp '{}' ./build/stock.apk \;
            
            ./build-from-prebuilt.sh
            
            find ./finished -maxdepth 1 -name ytrevanced.apk -exec rm {} \;
            
            find ./ -maxdepth 1 -name revanced.apk \
            -exec cp '{}' ./finished/ytrevanced.apk \;
            echo
            echo -e "\e[1;35mFinished Building Youtube\e[0m"
            ;;
        2)
            echo -e "\e[1;35mBuilding Youtube Music\e[0m"
            echo
            ./delete.sh
            
            find ./stock -name '*.youtube.music_*' \
            -exec cp '{}' ./build/stock.apk \;
            
            ./build-from-prebuilt.sh
            
            find ./finished -maxdepth 1 -name ytmusic.apk -exec rm {} \;
            
            find ./ -maxdepth 1 -name revanced.apk \
            -exec cp '{}' ./finished/ytmusic.apk \;
            echo
            echo -e "\e[1;35mFinished Building Youtube Music\e[0m"
            ;;
esac
