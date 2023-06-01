#Get High Performance Power Plan GUID
$HighPerformance = powercfg -l | ForEach-Object {if($_.contains("High performance")) {$_.split()[3]}}

#Set Power Plan to High Performance
powercfg -setactive $HighPerformance

#Disable Timeouts/Hibernate
powercfg -x -monitor-timeout-ac 0
powercfg -x -monitor-timeout-dc 0
powercfg -x -disk-timeout-ac 0
powercfg -x -disk-timeout-dc 0
powercfg -x -standby-timeout-ac 0
powercfg -x -standby-timeout-dc 0
powercfg -x -hibernate-timeout-ac 0
powercfg -x -hibernate-timeout-dc 0