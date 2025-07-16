. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Account Policies ===`n"

# Rename default accounts
try {
    $admin = Get-LocalUser -Name "Administrator" -ErrorAction SilentlyContinue
    if ($admin) {
        Rename-LocalUser -Name "Administrator" -NewName "AdminCustom"
        Write-Host "Renamed 'Administrator' to 'AdminCustom'"
    } else {
        Write-Host "'Administrator' account already renamed or not found."
    }

    $guest = Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue
    if ($guest) {
        Rename-LocalUser -Name "Guest" -NewName "GuestCustom"
        Write-Host "Renamed 'Guest' to 'GuestCustom'"
    } else {
        Write-Host "'Guest' account already renamed or not found."
    }
} catch {
    Write-Warning "Error renaming accounts: $_"
}

# Password policies
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'PasswordHistorySize' -DesiredValue 24
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'MaximumPasswordAge' -DesiredValue 365
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'MinimumPasswordAge' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'MinimumPasswordLength' -DesiredValue 14
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RelaxMinimumPasswordLengthLimits' -DesiredValue 1

# Account lockout policies
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LockoutDuration' -DesiredValue 15
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LockoutThreshold' -DesiredValue 5
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'ResetLockoutCount' -DesiredValue 15

# Guest account status
Set-RegistryValueIfNeeded -Path 'HKLM\SAM\SAM\Domains\Account' -Name 'DisableGuestAccount' -DesiredValue 1

# Limit blank password use
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LimitBlankPasswordUse' -DesiredValue 1

# Password expiry warning
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'PasswordExpiryWarning' -DesiredValue 14

Write-Host "`n✔ Account policies applied.`n"