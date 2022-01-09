#Params
$timezone = "Eastern Standard Time"
$domain_name = "dynsystems.com"
$dsrm_pw = ConvertTo-SecureString "@bcd12341234!!!!" -AsPlainText -Force
#Set Timezone to Eastern Standard Time
Set-TimeZone -id $timezone

#Setup AD
Add-WindowsFeature AS-Domain-Services
Install-ADDSForest -DomainName $domain_name -InstallDNS -safemodeadministratorpassword $dsrm_pw -confrim:$false