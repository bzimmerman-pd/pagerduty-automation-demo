$PSVersionTable

Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, InstallDate, LastBootUpTime

Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed, AddressWidth

Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum |
    Select-Object @{Name="TotalMemory";Expression={$_.Sum / 1GB}}

Get-CimInstance Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3} |
    Select-Object DeviceID, MediaType, Size, FreeSpace, @{Name="PercentFree";Expression={"{0:P2}" -f ($_.FreeSpace / $_.Size)}} |
    Sort-Object DeviceID
