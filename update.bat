@echo off
echo:
echo      Requierments:
echo:
echo:
echo        Python (3.9.5) installed and added to PATH
echo:
echo           https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe
echo:
echo:
echo        Git installed
echo:
echo           https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe
echo:
echo:
pause>nul
set one = True
:i
where python >nul 2>nul
if %errorlevel% equ 0 (
  echo Python is installed
  python --version
  pip --version
  :: https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe
  git --version
  rd /s /q idcrypter
  git clone --q https://github.com/ImWillIdk/idcrypter.git
  cd idcrypter
  start setup.bat
  exit
) else (
  echo Python is not installed.
  if one == True (
  echo Installing...
  echo https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe
  start https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe
  pause>nul
  python-3.9.5-amd64.exe /qb
  set one == False
  ) else (
    echo Waiting 30 sec to check the install...
    timeout /t 30
  )
)
goto :i