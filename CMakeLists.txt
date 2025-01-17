#------------------------------------------------------------------------------
# Top-level CMake file for bcos-boostssl
# ------------------------------------------------------------------------------
# Copyright (C) 2021 bcos-boostssl
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#------------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.10)
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13" CACHE STRING "Minimum OS X deployment version")

include(FetchContent)
if (NOT DEFINED URL_BASE)
    set(URL_BASE "github.com")
    # set(URL_BASE "github.com.cnpmjs.org")
endif()

set(BCOS_BOOSTSSL_CMAKE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake" CACHE PATH "The cmake path for the library")
list(APPEND CMAKE_MODULE_PATH ${BCOS_BOOSTSSL_CMAKE_DIR})

#init hunter
#include(HunterGate)
#HunterGate(
#    URL "https://${URL_BASE}/FISCO-BCOS/hunter/archive/514cacbc13c813690c78528c6092bb7915241f16.tar.gz"
#    SHA1 "0170c8daef905b461c22633121a452cc4fbcb232"
#    FILEPATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.cmake"
#)

#init hunter
include(HunterGate)
HunterGate(
    URL "https://github.com/awangbrace/hunter/archive/refs/tags/v0.23.295.1.tar.gz"
    SHA1 "5da74a940a34dafacd3f6a5c6265c70fdf4b6b10"
    FILEPATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.cmake"
)

project(bcos-boostssl VERSION "1.0.0")
set(VERSION_SUFFIX "-rc3")

# basic settings
include(Options)
configure_project()
include(CompilerSettings)

set(CMAKE_THREAD_LIBS_INIT "-lpthread")
set(CMAKE_HAVE_THREADS_LIBRARY 1)
set(CMAKE_USE_WIN32_THREADS_INIT 0)
set(CMAKE_USE_PTHREADS_INIT 1)
set(THREADS_PREFER_PTHREAD_FLAG ON)

# Boost
hunter_add_package(Boost COMPONENTS all)
find_package(Boost CONFIG REQUIRED log chrono system filesystem thread iostreams)

# OpenSSL
hunter_add_package(OpenSSL)
find_package(OpenSSL REQUIRED)

# JsonCpp
hunter_add_package(jsoncpp)
find_package(jsoncpp CONFIG REQUIRED)

# bcos-utilities
hunter_add_package(bcos-utilities)
find_package(bcos-utilities CONFIG REQUIRED)

include_directories(${CMAKE_INSTALL_INCLUDEDIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_INSTALL_INCLUDEDIR}/include)

# install dependencies
# include(InstallBcosFrameworkDependencies)

set(BOOSTSSL_TARGET "bcos-boostssl")

include(InstallConfig)
# install the include files for hash
include(InstallInclude)

add_subdirectory(bcos-boostssl)

# install bcos-boostssl
install(
    TARGETS ${BOOSTSSL_TARGET}
    EXPORT "${TARGETS_EXPORT_NAME}"
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

# TODO: remove ut temp for remove bcos-framework deps
# ut
# if (TESTS)
#    enable_testing()
#    set(CTEST_OUTPUT_ON_FAILURE TRUE)
#    add_subdirectory(test)
# endif()

if (BUILD_EXEC_TEST)
    add_subdirectory(test/exec)
endif()

# for code coverage
# if (COVERAGE)
#     include(Coverage)
#     config_coverage("boostssl-coverage" "'/usr*' '${CMAKE_CURRENT_SOURCE_DIR}/bcos-cmake-scripts*' '${CMAKE_SOURCE_DIR}/test/mock**' '${CMAKE_SOURCE_DIR}/test/main**'")
# endif ()
