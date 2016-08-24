#!/bin/bash

birthdate=$(date -d "25 August 1991")

#Using day and month of date, since %j option won't work on leap years
if [[ $(date -d "$birthdate" +%d\ %B) == $(date +%d\ %B) ]] ; then
	age=$(($(date +%Y) - $(date -d "$birthdate" +%Y)))
	suffix="th"
	case $((age%100)) in
		1|[2-9]1)
			suffix="st"
			;;
		2|[2-9]2)
			suffix="nd"
			;;
		3|[2-9]3)
			suffix="rd"
			;;
	esac

	echo "Happy $age$suffix birthday, Linux!"
	if [[ $(command -v espeak) ]] ; then
		espeak "Happy $age$suffix birthday, Linux!"
	fi
fi
