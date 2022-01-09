#Params
$groupname = "TestGroup"
$adusers = "User01", "User02"
$defaultpw = ConvertTo-SecureString -AsPlainText "Abcd1234!!!!" -Force
#Create group and base users
New-ADGroup $groupname -GroupScope Global -GroupCategory Security
foreach ($user in $adusers){
    New-ADUser -name $user -AccountPassword $defaultpw
    Add-ADGroupMember -Identity $groupname -Members $user
}