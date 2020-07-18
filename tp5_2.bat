@echo off
cls
:BEGIN 
echo.
choice /c 123 /n /m "Create - 1 ; Files - 2; End - 3 "

IF ERRORLEVEL 3 GOTO three

IF ERRORLEVEL 2 GOTO two

IF ERRORLEVEL 1 GOTO one 


:one 
set /A sum=0
for %%f in (%*) do set/a sum=sum+1
echo.
if %sum%==0 (
echo Name of the file ?
set /p num1=
echo %CD%
dir \s %CD% >  C:\tempso\%%num1.txt
)else (
dir \s %CD% >  C:\tempso\%1.txt
)
GOTO BEGIN
:two 
if NOT exist C:\tempso  mkdir C:\tempso

XCOPY %CD%\*.txt C:\tempso /i
GOTO BEGIN
:three 


PAUSE
:END