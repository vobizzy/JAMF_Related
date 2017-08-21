currentUser=`stat -f '%Su' /dev/console`
loginKeychain=`su $currentUser -c "security default-keychain"`
su $currentUser -c "security delete-keychain $loginKeychain"
