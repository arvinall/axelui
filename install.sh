#!/bin/bash
echo '1'
echo '#installing wizard'
zenity --text-info --filename=license --title='GNU GPL V3' --checkbox='Do you accept the license ?' --height=450 --width=500
if [[ $? = 1 ]] ; then
	zenity --info --text='This script is under GPL v3 you should to accept it to install !!!'
	exit
fi

	zenity --info --text='plZ enter your password for install'
(
	echo '20'
	echo '#Set Permissions'
       chmod a+x axelfast && chmod a+x axelui
	echo '40'
	echo '#Copy axelfast'
       gksudo cp axelfast /usr/bin/axelfast
	echo '60'
	echo '#Copy axelui'
       gksudo cp axelui /usr/bin/axelui
	echo '70'
	echo '#Copy urlentry.info'
    gksudo mkdir /usr/share/doc/axelui && gksudo cp urlentry.info /usr/share/doc/axelui/urlentry.info
	echo '80'
	echo '#Copy license'
       gksudo cp license /usr/share/doc/axelui/license
	echo '99'
	echo '#Copy axelui.desktop (shortcut)'
       gksudo cp axelui.desktop /usr/share/applications/axelui.desktop
	echo '100'
	echo '#Install finished'
) | zenity --progress --no-cancel --width=400 --title='installing'
	zenity --info --text='Install finished'
