# Xóa các file tạm thời và không cần thiết
Remove-Item -Path "$env:SystemDrive\*.tmp" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\*._mp" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\*.crdownload" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\*.log" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\*.gid" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\*.chk" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\*.old" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:windir\*.bak" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\recycled\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:windir\SoftwareDistribution\Download\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:windir\temp\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:windir\prefetch\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\recent\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:ProgramFiles(x86)\Google\Update\Download\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:ProgramFiles\Google\Update\Download\*" -Force -Recurse -ErrorAction SilentlyContinue

# Xóa và tạo lại các thư mục
Remove-Item -Path "$env:SystemDrive\recycled" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:SystemDrive\recycled" -ItemType Directory -Force

Remove-Item -Path "$env:windir\temp" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:windir\temp" -ItemType Directory -Force

Remove-Item -Path "$env:windir\Prefetch" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:windir\Prefetch" -ItemType Directory -Force

Remove-Item -Path "$env:temp" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:temp" -ItemType Directory -Force

Remove-Item -Path "$env:SystemDrive\SWSetup" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\Dell" -Force -Recurse -ErrorAction SilentlyContinue

Remove-Item -Path "$env:USERPROFILE\recent" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:USERPROFILE\recent" -ItemType Directory -Force

Remove-Item -Path "$env:windir\SoftwareDistribution\Download" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:windir\SoftwareDistribution\Download" -ItemType Directory -Force

Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temporary Internet Files" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:USERPROFILE\AppData\Local\Temporary Internet Files" -ItemType Directory -Force

Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$env:USERPROFILE\AppData\Local\Temp" -ItemType Directory -Force

Clear-RecycleBin -Force

# Hiển thị thông báo
Add-Type -AssemblyName Microsoft.VisualBasic
[Microsoft.VisualBasic.Interaction]::MsgBox("GALVIN")

Exit
