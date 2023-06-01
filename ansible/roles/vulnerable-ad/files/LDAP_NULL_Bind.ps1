# Enable LDAP NULL Bind
#
# This should not be used in production! This script enables unauthenticated/NULL LDAP bind.
# The intent of this script is to enable NULL LDAP bind for use with CTF or lab environments.
#
# References
# https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.activedirectorysecurityinheritance?view=dotnet-plat-ext-7.0
# https://learn.microsoft.com/en-us/windows/win32/secauthz/well-known-sids
# https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/e5899be4-862e-496f-9a38-33950617d2c5
# https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.activedirectoryaccessrule?view=windowsdesktop-7.0


#Get Domain Distinguished Name (DN)
$DomainDN = Get-ADDomain | Select -ExpandProperty DistinguishedName

#Modify 'dsHeuristics' to allow NULL Bind
$DirectoryService = Get-ADObject -Identity "CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,$DomainDN"
Set-ADObject -Identity $DirectoryService -Replace @{dsHeuristics = '0000002'}

#Set 'ANONYMOUS LOGON' to Active Directory with Read All Permissions
$AnonymousSID = [System.Security.Principal.SecurityIdentifier]"S-1-5-7"
$ADObject = [ADSI]("LDAP://$DomainDN")

#Read Objects Permissions
$ACEGetChanges = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($AnonymousSID,'GenericRead','Allow',1)
$ADObject.Get_ObjectSecurity().AddAccessRule($ACEGetChanges)

#List Objects Permissions
$ACEGetChanges = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($AnonymousSID,'ListObject','Allow',1)
$ADObject.Get_ObjectSecurity().AddAccessRule($ACEGetChanges)

#Add Permissions
$ADObject.psbase.CommitChanges()
