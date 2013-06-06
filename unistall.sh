#!/bin/bash
echo '1'
echo '#unistalling wizard'
zenity --question --title='Remove ?' --text='Do you want to un-install the axelui ?'
if [[ $? = 1 ]] ; then
	zenity --info --text='plZ enter your password for remove'
	exit
fi

(
	echo '25'
	echo '#Remove axelfast'
       gksudo rm /usr/bin/axelfast
	echo '50'
	echo '#Remove axelui'
       gksudo rm /usr/bin/axelui
	echo '75'
	echo '#Remove urlentry.info'
       gksudo rm /usr/share/doc/axelui/urlentry.info
	echo '80'
	echo '#Remove license'
       gksudo rm /usr/share/doc/axelui/license && gksudo rmdir /usr/share/doc/axelui
	echo '99'
	echo '#Remove axelui.desktop (shortcut)'
       gksudo rm /usr/share/applications/axelui.desktop
	echo '100'
	echo '#Unistall finished'
) | zenity --progress --no-cancel --width=400 --title='removing'
	zenity --info --text='Unistall finished'
