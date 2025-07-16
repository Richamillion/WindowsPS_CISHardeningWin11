# Wrapper script to run all compliance modules
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logPath = "$PSScriptRoot\Logs\ComplianceRun_$timestamp.log"
$Global:DryRun = $true  # Set to $false to apply changes

# Ensure log folder exists
New-Item -Path "$PSScriptRoot\Logs" -ItemType Directory -Force | Out-Null

function Run-Module {
    param (
        [string]$ModuleName
    )
    Write-Host "`n▶ Running $ModuleName..."
    try {
        if ($dryRun) {
            Write-Host "Dry-run mode: Skipping execution of $ModuleName"
        } else {
            . "$PSScriptRoot\$ModuleName"
        }
        Add-Content -Path $logPath -Value "[$(Get-Date)] $ModuleName completed successfully."
    } catch {
        Write-Warning "Error running $ModuleName: $_"
        Add-Content -Path $logPath -Value "[$(Get-Date)] ERROR in $ModuleName: $_"
    }
}

# Run each module
$modules = @(
    'AccountPolicies.ps1',
    'AuditPolicies.ps1',
    'DefenderHardening.ps1',
    'FirewallConfig.ps1',
    'BitLockerConfig.ps1',
    'DeviceGuard.ps1',
    'PrivacyControls.ps1',
    'RemoteDesktopLockdown.ps1',
    'WindowsUpdate.ps1',
    'ServiceHardening.ps1',
    'MiscUXLockdown.ps1'
)

foreach ($mod in $modules) {
    Run-Module -ModuleName $mod
}

Write-Host "`n✅ Compliance toolkit execution complete."
Write-Host "Log saved to: $logPath"
