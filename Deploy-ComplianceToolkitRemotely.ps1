# === CONFIGURATION ===

param (
    [switch]$DryRun
)

$computers = @("PC01", "PC02", "PC03")  # Replace with your target hostnames

# Optional: Pull from Active Directory
# $computers = Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=domain,DC=com" | Select-Object -ExpandProperty Name

$localToolkitPath = "C:\ComplianceToolkit"  # Path to your toolkit on the admin machine
$remoteToolkitPath = "C$\ComplianceToolkit"  # Destination path on remote machines
$remoteScriptPath = "C:\ComplianceToolkit\Run-ComplianceToolkit.ps1"
$logFolder = "$PSScriptRoot\RemoteLogs"
$Global:DryRun = $DryRun.IsPresent  # Set global DryRun flag

New-Item -Path $logFolder -ItemType Directory -Force | Out-Null

# === CREDENTIAL PROMPT ===
$cred = Get-Credential -Message "Enter credentials for remote execution"

# === COPY TOOLKIT TO REMOTE MACHINES ===
foreach ($computer in $computers) {
    Write-Host "`n📦 Copying toolkit to $computer..."
    try {
        $dest = "\\$computer\$remoteToolkitPath"
        Copy-Item -Path $localToolkitPath -Destination $dest -Recurse -Force
        Write-Host "✔ Toolkit copied to $computer"
    } catch {
        Write-Warning "❌ Failed to copy to ${computer}: $_"
        Add-Content -Path "$logFolder\CopyErrors.log" -Value "[$(Get-Date)] ${computer}: $_"
    }
}

# === EXECUTE TOOLKIT REMOTELY ===
$scriptBlock = {
    param ($remoteScriptPath, $dryRunFlag)

    if (Test-Path $remoteScriptPath) {
        if ($dryRunFlag) {
            Write-Host "🧪 Dry-run mode: Simulating execution of $remoteScriptPath"
        } else {
            Write-Host "🚀 Executing $remoteScriptPath"
            & $remoteScriptPath
        }
    } else {
        Write-Host "❌ Toolkit not found at $remoteScriptPath"
    }
}

foreach ($computer in $computers) {
    Write-Host "`n🚀 Executing toolkit on $computer..."
    try {
        Invoke-Command -ComputerName $computer -ScriptBlock $scriptBlock -ArgumentList $remoteScriptPath, $dryRun -Credential $cred -ErrorAction Stop |
            Out-File -FilePath "$logFolder\$computer.log"
        Write-Host "✔ Execution complete for $computer. Log saved."
    } catch {
        Write-Warning "❌ Execution failed on ${computer}: $_"
        Add-Content -Path "$logFolder\ExecutionErrors.log" -Value "[$(Get-Date)] ${computer}: $_"
    }
}

Write-Host "`n✅ Remote deployment complete. Logs saved to: $logFolder"
