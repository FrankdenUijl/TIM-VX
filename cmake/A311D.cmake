set(PKG_NAME "OVXDRV")
message("Downloading A311D toolchain ...")
file(DOWNLOAD  "https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-i686-mingw32_arm-linux-gnueabihf.tar.xz"
    ${PROJECT_BINARY_DIR}/gcc-linaro-7.3.1-2018.05-i686-mingw32_arm-linux-gnueabihf.tar.xz
    SHOW_PROGRESS)
execute_process(COMMAND
    tar xf ${PROJECT_BINARY_DIR}/gcc-linaro-7.3.1-2018.05-i686-mingw32_arm-linux-gnueabihf.tar.xz)

set(TOOLCHAIN_DIR  ${PROJECT_BINARY_DIR}/gcc-linaro-7.3.1-2018.05-i686-mingw32_arm-linux-gnueabihf)
set(CMAKE_C_COMPILER ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-g++)
set(CMAKE_AR ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-ar)
set(CMAKE_AS ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-as)
set(CMAKE_LD ${TOOLCHAIN_DIR}/bin/arm-linux-gnueabihf-ld)

message("Downloading A311D SDK ...")
file(DOWNLOAD "https://github.com/VeriSilicon/TIM-VX/releases/download/v1.1.34/aarch64_A311D_6.4.8.tgz"
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8.tgz
    EXPECTED_MD5 "da530e28f73fd8b143330b6d1b97a1d8"
    SHOW_PROGRESS)
execute_process(COMMAND
    tar xf ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8.tgz)

set(OVXDRV_INCLUDE_DIRS)
list(APPEND OVXDRV_INCLUDE_DIRS
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/include
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/include/CL)

set(OVXDRV_LIBRARIES)
list(APPEND OVXDRV_LIBRARIES
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/lib/libCLC.so
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/lib/libGAL.so
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/lib/libOpenVX.so
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/lib/libOpenVXU.so
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/lib/libVSC.so
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/lib/libArchModelSw.so
    ${PROJECT_BINARY_DIR}/aarch64_A311D_6.4.8/lib/libNNArchPerf.so)

mark_as_advanced(${OVXDRV_INCLUDE_DIRS} ${OVXDRV_LIBRARIES})

if(${TIM_VX_ENABLE_VIPLITE})
    message("Downloading A311D VIPLite SDK ...")
    file(DOWNLOAD "https://github.com/VeriSilicon/TIM-VX/releases/download/v1.1.28/VIPLite_aarch64_A311D_1.3.5.tgz"
        ${PROJECT_BINARY_DIR}/VIPLite_aarch64_A311D_1.3.5.tgz
        EXPECTED_MD5 "a52839d1f5d37cac8219b0ddec301ddf"
        SHOW_PROGRESS)
    execute_process(COMMAND
        tar xf ${PROJECT_BINARY_DIR}/VIPLite_aarch64_A311D_1.3.5.tgz)

    set(VIPLITE_DRV_INCLUDE_DIR ${PROJECT_BINARY_DIR}/viplite/include)
    
    set(VIPLITE_DRV_LIBRARIES)
    list(APPEND VIPLITE_DRV_LIBRARIES
        ${PROJECT_BINARY_DIR}/viplite/drivers/libVIPlite.so
        ${PROJECT_BINARY_DIR}/viplite/drivers/libVIPuser.so
        )
    mark_as_advanced(${VIPLITE_DRV_INCLUDE_DIR} ${VIPLITE_DRV_LIBRARIES})
endif()
