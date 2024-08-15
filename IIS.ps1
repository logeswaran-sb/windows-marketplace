# Installing IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Create a simple HTML file to confirm IIS installation
$htmlContent = "<html><body><h1>IIS is successfully installed via CloudBase-Init!</h1></body></html>"
$htmlPath = "C:\inetpub\wwwroot\index.html"
$htmlContent | Out-File -FilePath $htmlPath -Encoding utf8

# Log the actions to a file
$logfile = "C:\cloudbase-init-iis-install.log"
Write-Output "IIS Installation completed successfully." >> $logfile
Write-Output "Created default HTML file at $htmlPath" >> $logfile
