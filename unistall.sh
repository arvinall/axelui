#!/bin/bash
echo '1'
echo '#unistalling wizard'
zenity --question --title='Remove ?' --text='Do you want to un-install the axelui ?'
if [[ $? = 1 ]] ; then
	exit
fi
	pass=`zenity --password --title='plZ enter your password for remove'`
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
	echo '25'
	echo '#Remove axelfast'
       echo $pass | sudo -S rm /usr/bin/axelfast
		sleep 0.5
	echo '50'
	echo '#Remove axelui'
       echo $pass | sudo -S rm /usr/bin/axelui
		sleep 0.5
	echo '75'
	echo '#Remove urlentry.info'
       echo $pass | sudo -S rm /usr/share/doc/axelui/urlentry.info
		sleep 0.5
	echo '80'
	echo '#Remove license'
       echo $pass | sudo -S rm /usr/share/doc/axelui/license && echo $pass | sudo -S rmdir /usr/share/doc/axelui
		sleep 0.5
	echo '99'
	echo '#Remove axelui.desktop (shortcut)'
       echo $pass | sudo -S rm /usr/share/applications/axelui.desktop
		sleep 0.6
	echo '100'
	echo '#Unistall finished'
) | zenity --progress --no-cancel --width=400 --title='removing' --auto-close
	zenity --info --text='Unistall finished'
