
ECHO building OpenEXR

echo zlib is a prerequisite for OpenEXR

SET current=%cd%

if not exist "prereq" ^
mkdir prereq
cd prereq

IF NOT EXIST "openexr\README" ^
git clone https://github.com/hybridetech/openexr.git

cd openexr
git pull
cd ..

if not exist "build\IlmBase" mkdir build\IlmBase
cd build\IlmBase
cmake -G "Visual Studio 14 2015 Win64"^
      -DCMAKE_PREFIX_PATH="%current%\local"^
      -DCMAKE_INSTALL_PREFIX="%current%\local"^
      -DBUILD_SHARED_LIBS:BOOL=OFF^
      ..\..\openexr\IlmBase

cmake --build . --target install --config Release -- /maxcpucount:8

rem msbuild ilmBase.sln /t:Build /p:Configuration=Release /p:Platform=x64

cd %current%
rem xcopy .\prereq\build\IlmBase\config\*.* .\local\include\OpenEXR\ /s /y
rem xcopy .\prereq\openexr\IlmBase\Half*.h .\local\include\OpenEXR\ /s /y
rem xcopy .\prereq\openexr\IlmBase\Half\*.h .\local\include\OpenEXR\ /s /y
rem xcopy .\prereq\openexr\IlmBase\Iex\*.h .\local\include\OpenEXR\ /s /y
rem xcopy .\prereq\openexr\IlmBase\IexMath\*.h .\local\include\OpenEXR\ /s /y
rem xcopy .\prereq\openexr\IlmBase\IlmThread\*.h .\local\include\OpenEXR\ /s /y
rem xcopy .\prereq\openexr\IlmBase\Imath\*.h .\local\include\OpenEXR\ /s /y

rem xcopy .\prereq\build\IlmBase\Half\Release\Half.* .\local\lib\ /s /y
rem xcopy .\prereq\build\IlmBase\Iex\Release\Iex-2_2.* .\local\lib\ /s /y
rem xcopy .\prereq\build\IlmBase\IexMath\Release\IexMath-2_2.* .\local\lib\ /s /y
rem xcopy .\prereq\build\IlmBase\IlmThread\Release\IlmThread-2_2.* .\local\lib\ /s /y
rem xcopy .\prereq\build\IlmBase\Imath\Release\Imath-2_2.* .\local\lib\ /s /y

cd prereq
if not exist "build\OpenEXR" mkdir build\OpenEXR
cd build\OpenEXR

cmake -G "Visual Studio 14 2015 Win64"^
      -DCMAKE_PREFIX_PATH="%current%\local"^
      -DCMAKE_INSTALL_PREFIX="%current%\local"^
      -DILMBASE_PACKAGE_PREFIX="%current%\local" ^
      -DZLIB_ROOT="%current%\local"^
      -DBUILD_SHARED_LIBS:BOOL=OFF^
      ..\..\openexr\OpenEXR

cmake --build . --target install --config Release
rem msbuild openEXR.sln /t:Build /p:Configuration=Release /p:Platform=x64

cd %current%

rem xcopy .\prereq\build\OpenEXR\IlmImf\Release\IlmImf*.lib .\local\lib\ /s /y
rem xcopy .\prereq\build\OpenEXR\IlmImf\Release\IlmImf*.dll .\local\bin\ /s /y
rem xcopy .\prereq\build\OpenEXR\exrenvmap\Release\*.exe .\local\bin\ /s /y
rem xcopy .\prereq\build\OpenEXR\exrheader\Release\*.exe .\local\bin\ /s /y
rem xcopy .\prereq\build\OpenEXR\exrmakepreview\Release\*.exe .\local\bin\ /s /y
rem xcopy .\prereq\build\OpenEXR\exrmultipart\Release\*.exe .\local\bin\ /s /y
rem xcopy .\prereq\build\OpenEXR\exrmultiview\Release\*.exe .\local\bin\ /s /y
rem xcopy .\prereq\build\OpenEXR\exrstdattr\Release\*.exe .\local\bin\ /s /y
