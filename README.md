# RV64-Linux-Distribution

### 1.Introduction

This project is based on riscv-poky, which has most part similar with that repo. The purpose of this project is to automatically generate a RISCV Linux distribution with basic packages install on it. Also, in order to show it's flexible for install a new package, the project add a new software bbexample to the system. And this bbexample make the project slightly different with riscv-poky.



### 2.Build Everything



First you should set a proper environment. You should clone this repo in your ***home directory***：

```
git clone https://github.com/YiminHu/RV64-Linux-Distribution.git (in ~/ directory)
cd RV64-Linux-Distribution
source oe-init-build-env
```

Then everything will be ready to make:

```
cd ..
make
```

This step will download a bunch of packages and will take about 5 hours, be sure that your computer is able to access those source code on the internet.



### 3.Run the system

After all the steps finish:

```
cd build
runqemu qemuriscv64 nographic slirp
```

Login the system using root, and now you can use riscv64-poky-linux-gcc to compile C code. Also you can type bbexample to run the new software we install on the machine. Hopefully, you can see a hello world!



### 4.Tips

If you confront problems after make or unable to find bbexample on your machine, that means my pre-design .conf file may not suit your machine (which is not likely to happen), you can try the following steps with your own hand:

```
source oe-init-build-env
bitbake core-image-riscv
add a line: ${TOPDIR}/../meta-example \ to BBLAYERS ?= in build/conf/bblayers.conf
add a line: IMAGE_INSTALL_append = " bbexample" to build/conf/local.conf
bitbake bbexample
bitbake core-image-riscv
```  
Then runqemu to see the result.  
Please notice that there's no gcc(riscv-poky-gnu-gcc) by default, if you want to add gcc, modify meta-riscv/recipes-core/images/core-image-riscv.bb, you can see gcc install option has been commented out, just delete the '#' and rerun bitbake core-image-riscv.  
###5.More Details
If you are curious about the build process, it will be helpful to see the file ```Using Bitbake to Generate an Embedded RISCV Linux Distribution.pptx```in this repo.
