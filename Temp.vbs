' Đường dẫn tới file PowerShell script
strPSFile = objFSO.GetSpecialFolder(2) & "C:\RecycleBin.ps1"

' Tạo nội dung file PowerShell script
Set objFile = objFSO.CreateTextFile(strPSFile, True)
objFile.WriteLine("Remove-Item -Path `$env:SystemDrive\*.tmp -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path `$env:SystemDrive\*._mp -Force -Recurse -ErrorAction SilentlyContinue")
' (Thêm các lệnh PowerShell khác ở đây...)
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\*.tmp" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\*._mp" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\*.crdownload" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\*.log" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\*.gid" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\*.chk" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\*.old" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:windir\*.bak" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\recycled\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:windir\SoftwareDistribution\Download\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:windir\temp\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:windir\prefetch\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:USERPROFILE\recent\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:ProgramFiles(x86)\Google\Update\Download\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:ProgramFiles\Google\Update\Download\*" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\recycled" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:SystemDrive\recycled" -ItemType Directory -Force")
objFile.WriteLine("Remove-Item -Path "$env:windir\temp" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:windir\temp" -ItemType Directory -Force")
objFile.WriteLine("Remove-Item -Path "$env:windir\Prefetch" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:windir\Prefetch" -ItemType Directory -Force")
objFile.WriteLine("Remove-Item -Path "$env:temp" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:temp" -ItemType Directory -Force")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\SWSetup" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:SystemDrive\Dell" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("Remove-Item -Path "$env:USERPROFILE\recent" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:USERPROFILE\recent" -ItemType Directory -Force")
objFile.WriteLine("Remove-Item -Path "$env:windir\SoftwareDistribution\Download" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:windir\SoftwareDistribution\Download" -ItemType Directory -Force")
objFile.WriteLine("Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temporary Internet Files" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:USERPROFILE\AppData\Local\Temporary Internet Files" -ItemType Directory -Force")
objFile.WriteLine("Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp" -Force -Recurse -ErrorAction SilentlyContinue")
objFile.WriteLine("New-Item -Path "$env:USERPROFILE\AppData\Local\Temp" -ItemType Directory -Force")
objFile.WriteLine("Clear-RecycleBin -Force")
objFile.WriteLine("Add-Type -AssemblyName Microsoft.VisualBasic")
objFile.WriteLine("[Microsoft.VisualBasic.Interaction]::MsgBox('GALVIN')")
objFile.WriteLine("Exit")
objFile.Close

' Chạy PowerShell script
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File """ & strPSFile & """", 0, True

' Xóa file PowerShell script sau khi chạy
objFSO.DeleteFile strPSFile

' Xóa file VBS (chính nó) sau khi chạy
objFSO.DeleteFile WScript.ScriptFullName
objShell.Run "powershell.exe exit", 0, False
