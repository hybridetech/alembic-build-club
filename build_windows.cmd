REM ensure a 64 bit development environment using VS2015
rem IF NOT %VisualStudioVersion%=="14.0" ^
rem call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64
ECHO Building Alembic

call ..\alembic-build-club\prerequisites-vc140-x64\zlib.cmd
call ..\alembic-build-club\prerequisites-vc140-x64\hdf5.cmd
call ..\alembic-build-club\prerequisites-vc140-x64\boost.cmd
call ..\alembic-build-club\prerequisites-vc140-x64\openexr.cmd
call ..\alembic-build-club\prerequisites-vc140-x64\pyIlmBase.cmd
call ..\alembic-build-club\prerequisites-vc140-x64\alembic.cmd
call ..\alembic-build-club\prerequisites-vc140-x64\softimage.cmd

