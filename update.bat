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
set two = True
:i
where python >nul 2>nul
if %errorlevel% equ 0 (
  echo:
  echo Python is installed
  python --version
  pip --version
  where git >nul 2>nul
  if %errorlevel% equ 0 (
    echo:
    echo Git is installed.
    git --version
    rd /s /q idcrypter
    git clone --q https://github.com/ImWillIdk/idcrypter.git
    cd idcrypter
    start setup.bat
    exit
  ) else (
    echo:
    echo Git is not installed.
    echo:
    if two == True (
      echo Installing Git...
      echo:
      echo https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe
      start https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe
      pause
      Git-2.40.0-64-bit /qb
      set two = False
    ) else (
      echo:
      echo Waiting 60 sec to check the install...
      echo:
      timeout /t 60
    )
  )
) else (
  echo:
  echo Python is not installed.
  echo:
  if one == True (
    echo Installing Python...
    echo:
    echo https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe
    start https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe
    pause
    python-3.9.5-amd64.exe /qb
    set one = False
  ) else (
    echo:
    echo Waiting 60 sec to check the install...
    echo:
    timeout /t 60
  )
)
goto :i