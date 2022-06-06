Import-Module -Name ActiveDirectory

$ID_1 = Read-host "Enter ID user to copy from"
try
{
  $ADUser1 = Get-ADUser -Identity $ID_1 -ErrorAction Stop
}
catch
{
  Write-Warning "An error occured: $($_.Exception.Message)"
  exit
}
$ID_2 = Read-host "Enter ID user to copy to"
try
{
  $ADUser2 = Get-ADUser -Identity $ID_2 -ErrorAction Stop
}
catch
{
  Write-Warning "An error occured: $($_.Exception.Message)"
  exit
}

$CopyFromUser = Get-ADUser -Identity $ID_1 -prop MemberOf
$CopyToUser = Get-ADUser -Identity $ID_2 -prop MemberOf
$CopyFromUser.MemberOf | Where{$CopyToUser.MemberOf -notcontains $_} |  Add-ADGroupMember -Members $CopyToUser

#(Get-ADUser -Identity $ID_1 –Properties MemberOf).memberof | Get-ADGroup | Select-Object name