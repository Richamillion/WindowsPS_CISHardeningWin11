. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Windows Defender Hardening ===`n"

# Enable ASR rules globally
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR' -Name 'ExploitGuard_ASR_Rules' -DesiredValue 1

# Enable individual ASR rules
$asrRules = @(
    "26190899-1602-49e8-8b27-eb1d0a1ce869",
    "3b576869-a4ec-4529-8536-b80a7769e899",
    "56a863a9-875e-4185-98a7-b882c64b5ce5",
    "5beb7efe-fd9a-4556-801d-275e5ffc04cc",
    "75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84",
    "7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c",
    "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b",
    "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2",
    "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4",
    "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550",
    "d3e037e1-3eb8-44c8-a917-57927947596d",
    "d4f940ab-401b-4efc-aadc-ad5f3c50688a",
    "e6db77e5-3df2-4cf1-b95a-636979351e5b"
)
foreach ($rule in $asrRules) {
    Set-RegistryValueIfNeeded -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name $rule -DesiredValue 1
}

# Enable Network Protection
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection' -Name 'EnableNetworkProtection' -DesiredValue 1

# Real-time protection settings
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection' -Name 'DisableRealtimeMonitoring' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection' -Name 'EnableBehaviorMonitoring' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection' -Name 'EnableScriptScanning' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection' -Name 'ScanDownloads' -DesiredValue 1

# PUA protection
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'PUAProtection' -DesiredValue 1

# Enable file hash computation
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine' -Name 'EnableFileHashComputation' -DesiredValue 1

# Disable Defender shutdown
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -DesiredValue 0

# Disable Watson reporting
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting' -Name 'SendWatsonEvents' -DesiredValue 0

Write-Host "`n✔ Windows Defender hardening applied.`n"