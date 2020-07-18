@echo off
cls
:BEGIN 
cls
echo 'for this program work it is needed to run as administrator '
echo '******************* Create Users ***************************************'
echo.
choice /c 1234 /n /m "Add users - 1 ; Add groups - 2; Associate Users with goups - 3; Exit - 4 "

IF ERRORLEVEL 4 GOTO four 

IF ERRORLEVEL 3 GOTO three

IF ERRORLEVEL 2 GOTO two

IF ERRORLEVEL 1 GOTO one 


:one 
echo Name of the user ?
set /p name=
echo. 
echo Password ?
set /p pass=

net user /add %name% %pass%

@echo off
@echo New user >> users.txt
@echo ------>> users.txt
@echo %name%>> users.txt
@echo %pass%>> users.txt
@echo ------>> users.txt

cls
echo.

echo add more users  (1 - yes)?
set /p asw=

if %asw%==1 (GOTO one) else (GOTO BEGIN)

:two 
echo Name of the group ?
set /p name=
echo. 


net localgroup %name% /add

@echo off
@echo New group >> groups.txt
@echo ------>> groups.txt
@echo %name%>> groups.txt
@echo ------>> groups.txt

cls
echo.

echo add more groups  (1 - yes)?
set /p asw=

if %asw%==1 (GOTO two) else (GOTO BEGIN)

:three 
more groups.txt
echo --------------*Groups*------------
more users.txt

echo.
echo.

echo Name of the user ?
set /p name=
echo. 
echo Name of the group ?
set /p group=

net localgroup %group% %user% /add

@echo off
@echo New group >> groupsuser.txt
@echo ------>> groupsuser.txt
@echo %name% --- %group% >> groupsuser.txt
@echo ------>> groupsuser.txt


echo.
cls 
echo associate more groups to users (1 - yes)?
set /p asw=

if %asw%==1 (GOTO three) else (GOTO BEGIN)



:four
PAUSE
:END