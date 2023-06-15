# -*- coding: utf-8 -*-
Get-ADUser -Filter * -Properties DisplayName,Company,EmailAddress |
ForEach-Object {
    $mailboxSize = (Get-MailboxStatistics $_.SamAccountName).TotalItemSize.Value.ToMB()
    Write-Host "ФИО: $($_.DisplayName)"
    Write-Host "Организация: $($_.Company)"
    Write-Host "Почта: $($_.EmailAddress)"
    Write-Host "Размер ящика: $mailboxSize MB"
}