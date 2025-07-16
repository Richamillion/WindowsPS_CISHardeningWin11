# Shared\Functions.ps1

$Global:DryRun = $true  # Default; can be overridden by Run or Deploy remote scripts

function Set-RegistryValueIfNeeded {
    param (
        [string]$Path,
        [string]$Name,
        [object]$DesiredValue,
        [string]$Type = 'DWord'
    )
    if (Test-Path $Path) {
        $currentValue = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name
        if ($currentValue -ne $DesiredValue) {
            Write-Host "Updating $Name at $Path from '$currentValue' to '$DesiredValue'"
            if (-not $Global:DryRun) {
                Set-ItemProperty -Path $Path -Name $Name -Value $DesiredValue -Type $Type
            } else {
                Write-Host "Dry-run: Skipped setting $Name"
            }
        } else {
            Write-Host "$Name at $Path already set to desired value '$DesiredValue'. Skipping."
        }
    } else {
        Write-Warning "Registry path $Path does not exist. Skipping $Name."
    }
}

function Disable-ServiceIfNeeded {
    param (
        [string]$ServiceName
    )
    $svc = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
    if ($svc) {
        if ($svc.StartType -ne 'Disabled') {
            Write-Host "Disabling service: $ServiceName"
            if (-not $Global:DryRun) {
                Set-Service -Name $ServiceName -StartupType Disabled
            } else {
                Write-Host "Dry-run: Skipped disabling $ServiceName"
            }
        } else {
            Write-Host "Service $ServiceName already disabled. Skipping."
        }
    } else {
        Write-Warning "Service $ServiceName not found."
    }
}

function Set-AuditPolicyIfNeeded {
    param (
        [string]$Subcategory,
        [string]$Success = $null,
        [string]$Failure = $null
    )
    $current = auditpol /get /subcategory:"$Subcategory" | Select-String "$Subcategory"
    if ($current) {
        if ($Success -and ($current -notmatch "Success\s+Enabled")) {
            Write-Host "Enabling Success auditing for $Subcategory"
            if (-not $Global:DryRun) {
                auditpol /set /subcategory:"$Subcategory" /success:enable
            } else {
                Write-Host "Dry-run: Skipped enabling Success for $Subcategory"
            }
        }
        if ($Failure -and ($current -notmatch "Failure\s+Enabled")) {
            Write-Host "Enabling Failure auditing for $Subcategory"
            if (-not $Global:DryRun) {
                auditpol /set /subcategory:"$Subcategory" /failure:enable
            } else {
                Write-Host "Dry-run: Skipped enabling Failure for $Subcategory"
            }
        }
    } else {
        Write-Warning "Audit subcategory $Subcategory not found."
    }
}
