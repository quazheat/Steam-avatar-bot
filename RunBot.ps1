Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$notifyIcon = New-Object System.Windows.Forms.NotifyIcon
$notifyIcon.Icon = [System.Drawing.SystemIcons]::Application  
$notifyIcon.Visible = $true
$notifyIcon.Text = "Steam Avatar Bot"
$contextMenu = New-Object System.Windows.Forms.ContextMenu
$exitItem = New-Object System.Windows.Forms.MenuItem "Exit"
$contextMenu.MenuItems.Add($exitItem)
$notifyIcon.ContextMenu = $contextMenu

$bashPath = "C:\msys64\usr\bin\bash.exe"
$scriptPath = "C:\Users\Alex\Documents\SteamAvatarBot\change.sh"

$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = $bashPath
$psi.Arguments = $scriptPath
$psi.WindowStyle = "Hidden"
$psi.UseShellExecute = $false

$process = [System.Diagnostics.Process]::Start($psi)

$exitItem.add_Click({
    if ($process -and !$process.HasExited) {
        $process.Kill()
    }
    $notifyIcon.Visible = $false
    [System.Windows.Forms.Application]::Exit()
    exit
})

[System.Windows.Forms.Application]::Run()
