@echo off

title Simon Says Game

setlocal enabledelayedexpansion

echo Welcome to Simon Says!
echo.
echo Simon says, press any key to start...
pause >nul

set /a level=1
set "sequence="
set "user_sequence="

:game_loop
cls
echo Level %level%
echo.

:: Generate the sequence
set "sequence="
for /l %%i in (1,1,%level%) do (
  set /a "random_num=!random! %% 4 + 1"
  if !random_num! equ 1 (
    set "sequence=!sequence!R"
  ) else if !random_num! equ 2 (
    set "sequence=!sequence!G"
  ) else if !random_num! equ 3 (
    set "sequence=!sequence!B"
  ) else (
    set "sequence=!sequence!Y"
  )
)

:: Display the sequence
echo Simon says: !sequence!
timeout /t 2 >nul

:: Get user input
set "user_sequence="
echo Your turn:
set /p "user_sequence="

:: Validate user input
if "%user_sequence%"=="!sequence!" (
  echo Correct!
  set /a level+=1
) else (
  echo Incorrect. Game Over!
  echo Your final level is %level%
  pause >nul
  exit
)

goto game_loop
