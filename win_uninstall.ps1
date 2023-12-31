# ****************************************************************************
# **
# ** Copyright (C) 2023 EUNOMATIX
# ** This program is free software: you can redistribute it and/or modify
# ** it under the terms of the GNU General Public License as published by
# ** the Free Software Foundation, either version 3 of the License, or
# ** any later version.
# **
# ** This program is distributed in the hope that it will be useful,
# ** but WITHOUT ANY WARRANTY; without even the implied warranty of
# ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# ** GNU General Public License for more details.
# **
# ** You should have received a copy of the GNU General Public License
# ** along with this program. If not, see <https://www.gnu.org/licenses/>.
# **
# ** Contact: info@eunomatix.com
# **
# **************************************************************************/
# PowerShell script for uninstalling browsermon on Windows

# Check if running with administrative privileges
$isAdmin = ([System.Security.Principal.WindowsIdentity]::GetCurrent()).Groups -match "S-1-5-32-544"
if (-not $isAdmin) {
    Write-Host "Please run this script with administrative privileges."
    Read-Host "Press Enter to close this window..."
    Exit
}

# Define the target directory
$TARGET_DIR = "C:\browsermon"

# Stop the browsermon service if it's running
if (Get-Service -Name "browsermon" -ErrorAction SilentlyContinue) {
    Stop-Service "browsermon"
}

# Wait for the service to stop
do {
    $serviceStatus = Get-Service -Name "browsermon" -ErrorAction SilentlyContinue
    if ($serviceStatus -eq $null -or $serviceStatus.Status -eq "Stopped") {
        break
    }
    Start-Sleep -Seconds 2
} while ($true)

# Remove the browsermon service using the browsermon.exe remove command
$browsermonExePath = Join-Path $TARGET_DIR "browsermon.exe"
Start-Process -FilePath $browsermonExePath -ArgumentList "remove"

# Wait for the service to be removed
do {
    $serviceStatus = Get-Service -Name "browsermon" -ErrorAction SilentlyContinue
    if ($serviceStatus -eq $null) {
        break
    }
    Start-Sleep -Seconds 2
} while ($true)

# Wait until the browsermon.exe process is not running before deleting the file
do {
    $browsermonProcess = Get-Process -Name "browsermon" -ErrorAction SilentlyContinue
    if ($browsermonProcess -eq $null) {
        break
    }
    Start-Sleep -Seconds 2
} while ($true)

# Forcefully delete the browsermon.exe file
try {
    Remove-Item -Path $browsermonExePath -Force -ErrorAction Stop
} catch {
    Write-Host "Error: Unable to delete $browsermonExePath. Please delete this file manually."
}

# Delete the installation directory
try {
    Remove-Item -Path $TARGET_DIR -Recurse -Force -ErrorAction Stop
} catch {
    Write-Host "Error: Unable to delete $TARGET_DIR. Please delete this directory manually."
}

Write-Host "Uninstallation complete."
Read-Host "Press Enter to close this window..."
