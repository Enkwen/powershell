$ouList = Get-ADOrganizationalUnit -Filter * 
foreach ($ou in $ouList) {
    $objectGUID = $ou.ObjectGUID
    Set-ADOrganizationalUnit -Identity $ou.DistinguishedName -add @{adminDescription = $objectGUID}
}