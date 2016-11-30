ECHO Building alembic_softimage

SET current=%cd%

if not exist "prereq" ^
mkdir prereq
cd prereq

rem echo "Retrieving Alembic at version 1.6.1 for compatibility"

rem if not exist "alembic/.git/config" ^
git clone https://github.com/hybridetech/Alembic_Softimage.git

cd alembic_softimage
git pull
cd ..

if not exist "build\alembic_softimage" ^
mkdir build\alembic_softimage
cd build\alembic_softimage

cmake  -G "Visual Studio 14 2015" -A x64^
    -DALEMBIC_LIB_USES_BOOST=ON^
    -DUSE_STATIC_BOOST=ON^
    -DBOOST_INCLUDEDIR="%current%\local\include"^
    -DBOOST_LIBRARYDIR="%current%\local\lib"^
    -DBoost_INCLUDE_DIR="%current%\local\include"^
    -DBoost_LIBRARY_DIR="%current%\local\lib"^
    -DCMAKE_PREFIX_PATH="%current%\local"^
    -DCMAKE_INSTALL_PREFIX="%current%\local"^
    -DALEMBIC_LIBRARYDIR="%current%\local\lib"^
    -DUSE_STATIC_HDF5=ON^
    -DUSE_HDF5=ON^
    -DHDF5_ROOT="%current%\local"^
    -DALEMBIC_PYILMBASE_PYIMATH_LIB="%current%\local\lib\libPyImath.lib"^
    -DILMBASE_ROOT="%current%\local"^
	../../alembic_softimage

cmake --build . --target install --config Release -- /maxcpucount:8

cd %current%
