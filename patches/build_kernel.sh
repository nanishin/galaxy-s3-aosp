#!/bin/sh

export ARCH=arm
#export CROSS_COMPILE=/home/build/linux-x86/toolchains/arm-eabi-4.4.3/bin/arm-eabi-

make arch=arm m0_00_defconfig
make -j8
