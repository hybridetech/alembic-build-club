ECHO Building Alembic

SET current=%cd%

if not exist "prereq" ^
mkdir prereq
cd prereq

echo "Retrieving Alembic at version 1.6.1 for compatibility"

if not exist "alembic/.git/config" ^
git clone https://github.com/hybridetech/alembic.git

cd alembic
git pull
rem todo - have a command line switch to allow top of tree
rem git checkout a3aa758
cd ..

if not exist "build\alembic" ^
mkdir build\alembic
cd build\alembic

cmake  -G "Visual Studio 14 2015" -A x64^
    -DALEMBIC_SHARED_LIBS:BOOL=OFF ^
    -DUSE_BINARIES=OFF ^
    -DUSE_TESTS=OFF ^
    -DALEMBIC_ILMBASE_LINK_STATIC:BOOL=TRUE ^
    -DCMAKE_PREFIX_PATH="%current%\local"^
    -DCMAKE_INSTALL_PREFIX="%current%\local"^
    -DUSE_PYILMBASE=ON -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=alembic-stage^
    -DALEMBIC_LIB_USES_BOOST=OFF^
    -DUSE_STATIC_BOOST=ON^
	-DBOOST_INCLUDEDIR="%current%\local\include"^
	-DBOOST_LIBRARYDIR="%current%\local\lib"^
	-DBoost_INCLUDE_DIR="%current%\local\include"^
	-DBoost_LIBRARY_DIR="%current%\local\lib"^
    -DUSE_STATIC_HDF5=ON^
    -DUSE_HDF5=ON^
	-DHDF5_ROOT="%current%\local"^
    -DUSE_PYALEMBIC=ON^
	-DALEMBIC_PYILMBASE_PYIMATH_LIB="%current%\local\lib\PyImath.lib"^
    -DALEMBIC_PYILMBASE_INCLUDE_DIRECTORY="%current%\local\include"^
    -DALEMBIC_PYIMATH_MODULE_DIRECTORY="%current%\local\lib\python2.7\site-packages"^
	-DILMBASE_ROOT="%current%\local"^
	-DALEMBIC_PYILMBASE_ROOT="%current%\local"^
	../../alembic

cmake --build . --target install --config Release -- /maxcpucount:8

cd %current%
