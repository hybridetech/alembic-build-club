ECHO Buidling boost

SET current=%cd%

if not exist "prereq" ^
mkdir prereq
cd prereq

if not exist "boost.tar.gz" ^
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://downloads.sourceforge.net/sourceforge/boost/boost_1_61_0.tar.gz', 'boost.tar.gz')"

if not exist "boost.tar" ^
7z x boost.tar.gz

if not exist "boost_1_61_0\INSTALL" ^
7z x -ttar boost.tar

if not exist "boost-build-club\README.md" ^
git clone https://github.com/vfxpro99/boost-build-club.git

cd boost-build-club
git pull
cd ..

xcopy .\boost-build-club\* .\boost_1_61_0\ /s /y
cd .\boost_1_61_0
rem call build-win-shared.bat
call build-win-static.bat
cd ..\..
xcopy .\prereq\boost_1_61_0\stage\lib\*.lib .\local\lib\ /s /y
xcopy .\prereq\boost_1_61_0\stage\lib\*.dll .\local\bin\ /s /y
xcopy .\prereq\boost_1_61_0\boost\* .\local\include\boost\ /s /y
