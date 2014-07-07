LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
KERNEL_DEFCONFIG := msm8974_find7_defconfig

-include device/qcom/msm8974/AndroidBoard.mk
