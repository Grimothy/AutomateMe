::@echo off
:: AutomateMe.bat by Sir Grim
:: This script will automate the packing of a pbo file
:: It will move the mission PBO to the mpmission folder that your specify as well as copy the file to your MPMissionCache
:: Use the Defines section to set your paths accordingly

SETLOCAL ENABLEDELAYEDEXPANSION
	
	::DEFINES
		
		Set PboConsoleExe= "C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe"
		Set PboFileName= "D:\Documents\Docs\Dev_ArmA3_Wasteland.Altis.pbo"
		Set Source= "D:\Documents\Docs\ArmA3_Wasteland.Altis"
		Set ServerMpMission= "D:\dev\MPMissions\"
		Set MpMissionCache=  "C:\Users\CJ\AppData\Local\Arma 3\MPMissionsCache\"
		Set TempMissionDir= "D:\Documents\Docs\Temp_Arma3_Wasteland.Altis"
		

	::Create Temp Directory
	mkdir %TempMissionDir%
	
	::Copy Source
	xcopy %Source% %TempMissionDir% /s /i
	
	::Pack into PBO
	%PboConsoleExe% -pack %TempMissionDir% %PboFileName%

	::Copy to Server MPMissions and MPMissionCache
	copy %PboFileName% %ServerMpMission%
	copy %PboFileName% %MpMissionCache%
	
	
	::Clean 
	del %PboFileName% /q
	rmdir %TempMissionDir% /s /q
	
	
		
		
		
