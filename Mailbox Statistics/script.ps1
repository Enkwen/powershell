# -*- coding: utf-8 -*-
Get-ADUser -Filter { EmailAddress -like '*' } -Properties DisplayName, Company, EmailAddress |
ForEach-Object {
    $mailboxSize = (Get-MailboxStatistics $_.SamAccountName).TotalItemSize.Value.ToMB()
    $props = @{
        Name                = $_.DisplayName
        Company             = $_.Company
        Email               = $_.EmailAddress
        "Mailbox Size (MB)" = $mailboxSize
    }
    New-Object PSObject -Property $props
} | Export-Csv -Path C:\Temp\mailboxes.csv -NoTypeInformation -Encoding UTF8