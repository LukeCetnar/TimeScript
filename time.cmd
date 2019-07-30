@echo off & @setlocal enableextensions

@echo Turn off the time service
net stop w32time
w32tm /unregister
w32tm /register

@echo Set the SNTP (Simple Network Time Protocol) source for the time server
w32tm /config /syncfromflags:manual /manualpeerlist:"0.ca.pool.ntp.org 1.ca.pool.ntp.org 2.ca.pool.ntp.org 3.ca.pool.ntp.org"

@echo turn on the time service back on
net start w32time

@echo Tell the time sync service to use the changes
w32tm /config /update

@echo Reset the local computer's time against the time server
w32tm /resync /rediscover

@endlocal & @goto :EOF

:EOF

end