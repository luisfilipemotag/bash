@echo off

echo.
set /A sum=0
for %%f in (%*) do set/a sum=sum+1
echo.
if %sum%==0 (
echo what extencion files you want to backup ?
set /p num1=
echo.
XCOPY C:\Users\Chip\*.%num1% C:\Users\Chip\backup /i
)else (
for %%f in (%*) do XCOPY C:\Users\Chip\*.%%f C:\Users\Chip\backup /i
)
echo Done!!!
PAUSE
