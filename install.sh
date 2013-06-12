#!/bin/bash
echo '1'
echo '#installing wizard'
zenity --text-info --filename=license --title='GNU GPL V3' --checkbox='Do you accept the license ?' --height=450 --width=500
if [[ $? = 1 ]] ; then
	zenity --info --text='This script is under GPL v3 you should to accept it to install !!!'
	exit
fi

	pass=`zenity --password --title='plZ enter your password for install'`
	if [ $? != 0 ]; then
		(
		echo `date`
		echo 'For install axel UI you need to have root Permission'
		echo 'Plz enter your password in wizard'
		echo ''
		) >> log
		echo 'find a problem Plz read log file'
		exit
	fi
(
	echo '20'
	echo '#Set Permissions'
       chmod a+x axelfast && chmod a+x axelui
		sleep 0.5
	echo '40'
	echo '#Copy axelfast'
       echo $pass | sudo -S cp axelfast /usr/bin/axelfast
		sleep 0.5
	echo '60'
	echo '#Copy axelui'
       echo $pass | sudo -S cp axelui /usr/bin/axelui
		sleep 0.5
	echo '70'
	echo '#Copy urlentry.info'
       echo $pass | sudo -S mkdir /usr/share/doc/axelui && echo $pass | sudo -S cp urlentry.info /usr/share/doc/axelui/urlentry.info
		sleep 0.5
	echo '80'
	echo '#Copy license'
       echo $pass | sudo -S cp license /usr/share/doc/axelui/license
		sleep 0.5
	echo '99'
	echo '#Copy axelui.desktop (shortcut)'
       echo $pass | sudo -S cp axelui.desktop /usr/share/applications/axelui.desktop
		sleep 0.6
	echo '100'
	echo '#Install finished'
) | zenity --progress --no-cancel --width=400 --title='installing' --auto-close
	zenity --info --text='Install finished'
