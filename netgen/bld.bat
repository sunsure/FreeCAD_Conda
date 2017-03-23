mkdir build -p
cd build 

cmake .. -G "Ninja" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    -DCMAKE_PREFIX_PATH=%PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DINSTALL_DIR=%LIBRARY_PREFIX% ^
    -DOCC_INCLUDE_DIR=%LIBRARY_PREFIX%\include\opencascade ^
    -DOCC_LIBRARY_DIR=%LIBRARY_PREFIX%\lib ^
    -DUSE_OCC=ON ^
    -DUSE_PYTHON=OFF ^
    -DUSE_GUI=OFF ^
    -DUSE_SUPERBUILD=OFF

if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1

mkdir %LIBRARY_PREFIX%\include\netgen -p
Copy %SRC_DIR%\build\config.h %LIBRARY_PREFIX%\include\netgen\mydefs.hpp