mountMasterDP() {

theSite=$(osascript <<AppleScript

set cyDPPath_CY to "afp://0.0.0.0/CasperShare"
set serverUser to "*****"
set serverPass to "*****"

try
    mount volume cyDPPath_CY as user name serverUser with password serverPass
on error
    tell application "System Events"
        keystroke return
    end tell
end try

AppleScript

)
}


namePKG() {
createDIR
fileName=$(osascript <<AppleScript
display dialog "Please name the package using this convention:

CampusRoom_MMDDYYYY

ex:
CY1785_06202016" default answer "" with title "Extract Printers to JSS" with icon caution

set pkgName to text returned of result

do shell script "pkgbuild --root /Users/admin/Desktop/Dock/ROOT --identifier edu.csn.macteam /Volumes/CasperShare/Packages/" & pkgName & ".pkg"

do shell script "rm -rf /Users/admin/Desktop/Dock/"

AppleScript

)
}

createDIR() {

mkdir /Users/admin/Desktop/Dock/
mkdir /Users/admin/Desktop/Dock/ROOT
mkdir /Users/admin/Desktop/Dock/ROOT/System
mkdir /Users/admin/Desktop/Dock/ROOT/System/Library/
mkdir /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template
mkdir /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj
mkdir /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj/Library
mkdir /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj/Library/Preferences

cp /Users/admin/Library/Preferences/com.apple.dock.plist /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj/Library/Preferences/


chown -R root:wheel /Users/admin/Desktop/Dock/


chmod 755 /Users/admin/Desktop/Dock/ROOT/System/
chmod 755 /Users/admin/Desktop/Dock/ROOT/System/Library/
chmod 700 /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/
chmod 755 /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj/
chmod 700 /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj/Library/
chmod 700 /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj/Library/Preferences/
chmod 644 /Users/admin/Desktop/Dock/ROOT/System/Library/User\ Template/English.lproj/Library/Preferences/com.apple.dock.plist

}

ejectCasperShare() {
	ejectShare=$(osascript <<AppleScript
	tell application "Finder"
    eject "CasperShare"
end tell

AppleScript
)
}

mountMasterDP
namePKG
ejectCasperShare
