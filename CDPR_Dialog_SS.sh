fileDate(){

macName=$(scutil --get ComputerName)
extentionType=.txt
pathOfFile="/Users/admin/tmp/"
dateCheck=`find /Users/admin/tmp -type f -mtime +31d -print | grep -v '^\.\/\.'`

if [[ $dateCheck == *$macName* ]]; then
	rm /Users/admin/tmp/*$macName*
	nicInterface=en0
	mkdir /Users/admin/tmp
	/usr/local/bin/cdpr -d $nicInterface | grep value > /Users/admin/tmp/$macName$extentionType
	sed -i -e 's/  value:  //g' /Users/admin/tmp/$macName$extentionType
	portID=`cat /Users/admin/tmp/$macName$extentionType`
	echo "<result>$portID</result>"

else
	echo "files are current"
	portID=`cat /Users/admin/tmp/$macName$extentionType`
	echo "<result>$portID</result>"
fi

osascript <<EOF
tell application "Finder"
	display dialog "$portID" with title "CDPR"
	end tell
EOF
}
fileDate
