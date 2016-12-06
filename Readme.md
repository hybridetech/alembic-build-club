
This project based on https://github.com/vfxpro99/usd-build-club includes recipes to build ILM's Alembic, it's
Python bindings, the Softimage plugin , and all necessary prerequisites for:

Only the windows version is working for now


Building Alembic on Windows
-----------------------
Note that the windows build is a work in progress, and the
branch may not yet be in a buildable state.

Prereqs:
 1. Install Visual Studio 2015

 1. Install Python 2.7 and Pip. When using the python.msi installer, installing pip, and putting Python in %PATH% are both options that should be selected.
 
 1. Install CMake and make sure its on your %PATH%

Run the build_windows.cmd

Please note that the HDF5 integer and floating point detection logic works
by failing and MSVC will pop up numerous Assertion dialogs. Thus, it's necessary
to "Ignore" and "Cancel" each and every one of them. This party game is super
annoying, and HDF5 support in Alembic is being phased out. For the moment, Alembic
is being compiled without HDF5 support.
