$updates = Get-WmiObject -Class Win32_QuickFixEngineering
foreach ($update in $updates) {
    $update | Select-Object HotFixID, Caption, InstalledOn
}
