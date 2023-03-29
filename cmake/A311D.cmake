set(PKG_NAME "OVXDRV")

message("Setting ANDROID_NDK environment ...")

set(TARGET "arm_android9_A311D_6.4.3")

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
