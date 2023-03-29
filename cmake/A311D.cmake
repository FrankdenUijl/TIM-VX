set(PKG_NAME "OVXDRV")
message("Downloading A311D toolchain ...")
file(DOWNLOAD  "https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz"
    ${PROJECT_BINARY_DIR}/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
    SHOW_PROGRESS)
execute_process(COMMAND
    tar xf ${PROJECT_BINARY_DIR}/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz)

set(TOOLCHAIN_DIR  ${PROJECT_BINARY_DIR}/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf)
set(CMAKE_C_COMPILER ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-g++)
set(CMAKE_AR ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-ar)
set(CMAKE_AS ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-as)
set(CMAKE_LD ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-ld)

message("Downloading A311D SDK ...")
file(DOWNLOAD "https://github.com/FrankdenUijl/TIM-VX/releases/download/Binaries/arm_A311D_6.4.4.3.tgz"
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3.tgz
    SHOW_PROGRESS)
execute_process(COMMAND
    tar xf ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3.tgz
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR})

set(OVXDRV_INCLUDE_DIRS)
list(APPEND OVXDRV_INCLUDE_DIRS
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/include
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/include/CL)

set(OVXDRV_LIBRARIES)
list(APPEND OVXDRV_LIBRARIES
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/lib/libGAL.so
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/lib/libOpenVX.so
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/lib/libOpenVXU.so
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/lib/libVSC.so
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/lib/libarchmodelSw.so
    ${PROJECT_BINARY_DIR}/arm_A311D_6.4.4.3/lib/libNNArchPerf.so)

mark_as_advanced(${OVXDRV_INCLUDE_DIRS} ${OVXDRV_LIBRARIES})
