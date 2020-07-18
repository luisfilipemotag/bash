@echo off

if NOT exist C:\tempso  mkdir C:\tempso

XCOPY %CD%\*.txt C:\tempso /i

dir \s C:\tempso\*.txt >  C:\tempso\zen.txt

PAUSE
