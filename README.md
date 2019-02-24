# galaxy-s3-aosp
Galaxy S3 (GT-I9300) AOSP build

## Kernel And Platform
* Last Release (I9300XXUGOE1)
    > GT-I9300_JB_Opensource.zip got from https://opensource.samsung.com
## Toolchain
* Use arm-eabi-4.4.3 by build guide
    > https://android.googlesource.com/platform/prebuilt/+archive/6c89c6601a699707500003b782406482c4c3050b/linux-x86.tar.gz
## Docker Build
* Inspired from https://github.com/gmacario/easy-build/blob/master/build-aosp/Dockerfile
### Caution
* If native filesystem of Mac OS is used for source volume mount, it will makes build error by overwritten case sensitive files in netfilter.

* If below error is occurred during compilation, it's toolchain broken by directory copy. You should keep original path after tar extraction.
    > arm-eabi-gcc: error trying to exec 'cc1': execvp: No such file or directory
### Build Docker Image
    > ./build.sh
### Run Docker Image
    > ./run.sh
### Build Galaxy S3 AOSP in Docker Container
#### Kernel Build
    > mkdir linux-x86

    > tar xvzf linux-x86.tar.gz -C linux-x86

    > mkdir /home/build/kernel_in_container
    
    > cd /home/build/kernel_in_container
    
    > tar xvzf /home/build/s3-src/Kernel.tar.gz

    > cp -f /home/build/patches/timeconst.pl_patch kernel/timeconst.pl
    
    > cp -f /home/build/patches/build_kernel.sh .
    
    > ./build_kernel.sh
#### Platform Build
    > Not yet tested
## License
* GPLv2
