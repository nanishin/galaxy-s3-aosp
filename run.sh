#!/bin/sh

CWD=`pwd`
#docker run -it -v ${CWD}/GT-I9300_JB_Opensource:/home/build/s3-src -v ${CWD}/toolchain/arm-eabi-4.4.3:/opt/toolchains/arm-eabi-4.4.3 -v ${CWD}/patches:/home/build/patches nanishin/galaxy-s3-aosp bash
docker run -it -v ${CWD}/GT-I9300_JB_Opensource:/home/build/s3-src -v ${CWD}/patches:/home/build/patches nanishin/galaxy-s3-aosp bash
