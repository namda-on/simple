SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR x86_64)

# Alpine Linux의 musl libc를 사용
SET(CMAKE_C_COMPILER gcc)
SET(CMAKE_CXX_COMPILER g++)

# Shared library prefix/suffix for Linux
SET(CMAKE_SHARED_LIBRARY_PREFIX "lib")
SET(CMAKE_SHARED_LIBRARY_SUFFIX ".so")

# Position Independent Code (PIC)는 공유 라이브러리에 필수적입니다.
# CMAKE_POSITION_INDEPENDENT_CODE를 ON으로 설정하면 CMake가 알아서 처리합니다.
# add_library(TARGET SHARED ...) 시 기본적으로 ON입니다.
# set_property(TARGET PINYIN_TEXT PROPERTY POSITION_INDEPENDENT_CODE ON)은 이미 CMakeLists.txt에 있습니다.

# SQLite3를 시스템 라이브러리로 링크 (Alpine Dockerfile에서 sqlite-dev 설치 시)
# FIND_PACKAGE(SQLite3 REQUIRED) 또는 TARGET_LINK_LIBRARIES(target sqlite3)를 사용하면 됩니다.
# 현재 CMakeLists.txt는 contrib에서 빌드하는 방식을 따르므로 이 부분은 그대로 둡니다.