$cpuCores = Get-WmiObject -Class Win32_Processor | select NumberOfCores
$cpuCount = Get-WmiObject -Class Win32_ComputerSystem | select NumberOfLogicalProcessors

for ($i = 0; $i -lt $cpuCores.NumberOfCores; $i++) {
  $coreLoad = (Get-WmiObject Win32_PerfFormattedData_PerfOS_Processor | where {$_.Name -eq "_Total"}).PercentProcessorTime
  Write-Host "Core $i utilization: $coreLoad%"
}