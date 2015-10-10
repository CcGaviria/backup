@echo off
set aa=%date:~6,4%
set mm=%date:~3,2%
set dd=%date:~0,2%
set Destino=U:\BackupDiario\%aa%-%mm%-%dd%
set Registros=U:\BackupDiario\log-%aa%-%mm%-%dd%.txt
echo %Destino%
echo %Registros%
MD %Destino%
CD /D C:\
FOR /f "tokens=*" %%j in (enlaces.txt) do (
MD "%Dest%%%j"
ROBOCOPY "%%j" "%Destino%%%j" /COPYALL /V /NP /E >> %Registros%
)
echo. **** Backup realizado ****
echo.
