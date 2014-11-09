mkdir out
cd out
mkdir msbuild
cd msbuild
cmake -G "Visual Studio 11" -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_CXX_COMPILER_ID=MSVC ../../build/cmake
cd ../../
