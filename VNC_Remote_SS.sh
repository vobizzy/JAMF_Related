user="****"
pass="****"
targetName=$(osascript <<AppleScript

display dialog "Please type the name of the target computer.

ex: CYA1722-8201541" default answer "" with title "VNC Remote"


set inputName to text returned of result


AppleScript
)








targetIP=`curl -s https://*******.******.edu:8443/JSSResource/computers/name/$targetName -u $user:$pass | sed -e 's/^.*"ip_address":"\([^"]*\)".*$/\1/'`
open vnc://$targetIP
