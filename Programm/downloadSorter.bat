REM @echo off
set origDir=%CD%
cd %CD:~0,3%
c:
cd %userprofile%\downloads
set key[]=
set Value[]=
set /A "loopvar=0"
setlocal ENABLEDELAYEDEXPANSION
FOR /F %%i IN (%origDir%\konfig.txt) DO (
  for /f "tokens=1,2 delims=," %%a in ("%%i") do (
    set key[!loopvar!]=%%a
    set value[!loopvar!]=%%b
    echo %key[!loopvar!]%
    echo %value[!loopvar!]%
  )
  set /A loopvar+=1
  echo !loopvar!
)
:loop
  for %%f in (*) do ( for %%d in (0,1,!loopvar!) do ( if %%~xf == key[!loopvar!] ( move "%userprofile%\downloads\%%~f" "Value[!loopvar!]\" ) ) )
  timeout /t 10 /nobreak > NUL
goto :loop
endlocal
