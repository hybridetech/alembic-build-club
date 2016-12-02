
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

if not exist "build\PyIlmBase" mkdir build\PyIlmBase
cd build\PyIlmBase
cmake -G "Visual Studio 14 2015 Win64"^
      -DCMAKE_PREFIX_PATH="%current%\local"^
      -DCMAKE_INSTALL_PREFIX="%current%\local"^
      -DILMBASE_PACKAGE_PREFIX="%current%\local" ^
      -DBoost_USE_STATIC_LIBS=ON^
      -DBOOST_INCLUDEDIR="%current%\local\include"^
      -DBOOST_LIBRARYDIR="%current%\local\lib"^
      -DBoost_INCLUDE_DIR="%current%\local\include"^
      -DBoost_LIBRARY_DIR="%current%\local\lib"^
      -DBUILD_SHARED_LIBS:BOOL=OFF^
      ..\..\openexr\PyIlmBase

rem      -DCMAKE_CXX_FLAGS="/DPYIMATH_EXPORTS /DPYIEX_EXPORTS /DBOOST_PYTHON_STATIC_LIB /DHAVE_ROUND /EHsc"^
cmake --build . --target install --config Release -- /maxcpucount:8

rem msbuild ilmBase.sln /t:Build /p:Configuration=Release /p:Platform=x64

cd %current%