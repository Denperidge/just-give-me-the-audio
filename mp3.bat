@echo off

SET outputext="%~n0"

cd app/

powershell -ExecutionPolicy ByPass "./Download-Binaries.ps1"
powershell -ExecutionPolicy ByPass "./Download-Video.ps1 %outputext%"

explorer.exe ./output
