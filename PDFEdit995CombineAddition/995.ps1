Write-Host "Hello, This Script Will Now Install The Required PDF995 Extention To Combine PDFs, Backup Your Registry,`n And 
Add The PDFEdit995 Program To The Right-Click File Context Menu. `n`nClose the URL PopUp After The 995 Extention Is Installed"

Start-Sleep -Seconds 10

Start-Process -FilePath "\\Server\Folder\PDF Combine PDF\signature995.exe"`n`n

Write-Warning "This script will now backup your registery, this will take a 2-3 minuets." -WarningAction Inquire

$cmdOutput = $env:UserName

New-Item -Path "C:\" -Name "$cmdOutput" -ItemType Directory | Out-Null

Start-Sleep -Seconds 2

Write-Host "Backing up Registry Hive 1 of 5, Please Wait..."`n`n

reg export 'HKEY_CLASSES_ROOT' C:\$cmdOutput\HKEY_CLASSES_ROOT.reg
Write-Host "Backing up Registry Hive 2 of 5 Please Wait..."`n`n

Start-Sleep -Seconds 2

reg export 'HKEY_CURRENT_USER' C:\$cmdOutput\HKEY_CURRENT_USER.reg

Write-Host "Backing up Registry Hive 3 of 5 Please Wait..."`n`n

reg export 'HKEY_LOCAL_MACHINE' C:\$cmdOutput\HKEY_LOCAL_MACHINE.reg

Write-Host "Backing up Registry Hive 4 of 5 Please Wait..."`n`n

Start-Sleep -Seconds 3

reg export 'HKEY_USERS' C:\$cmdOutput\HKEY_USERS.reg

Write-Host "Backing up Registry Hive 5 of 5 Please Wait..."`n`n

Start-Sleep -Seconds 1

reg export 'HKEY_CURRENT_CONFIG' C:\$cmdOutput\HKEY_CURRENT_CONFIG.reg

Start-Sleep -Seconds 7

Write-Host "Importing PDF 995 Registry Right File Click Please Wait..."`n`n

Start-Sleep -Seconds 7

reg import "\\Server\Folder\PDF Combine PDF\PDFEdit995 Context Addition.reg"



Move-Item -Path "C:\$cmdOutput" -Destination "\\Server\Folder\PDFEdit995CombineAddition\RegBackups\"

Start-Sleep -Seconds 7

Write-Host "Scrip End..."`n`n

Start-Sleep -Seconds 4
