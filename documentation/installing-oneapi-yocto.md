# Create a Yocto Image with Intel® oneAPI Components
This document provides instructions for creating a Yocto image with Intel® oneAPI components.

## System Requirements
Use the [Yocto Project official documentation](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#compatible-linux-distribution) to set up and configure your host machine to be compatible with BitBake.

## Step 1: Set Up Environment

### Set Up Git Repositories
The following Git repositories are required to build a Yocto image:

- [Poky](https://git.yoctoproject.org/poky)
- [Meta-intel](https://git.yoctoproject.org/meta-intel/tree/README)
- [Meta-openembedded](http://cgit.openembedded.org/meta-openembedded/tree/README)

Clone these Git repositories to your host machine:
```sh
git clone https://git.yoctoproject.org/git/poky --branch kirkstone
git clone https://git.yoctoproject.org/git/meta-intel --branch kirkstone
git clone https://git.openembedded.org/meta-openembedded --branch kirkstone
```

### Set up BitBake Layers

```sh
source poky/oe-init-build-env
bitbake-layers add-layer ../meta-intel
bitbake-layers add-layer ../meta-openembedded/meta-oe
```

### Set up BitBake Configurations

Include extra configuration in `conf/local.conf` in your build directory as required.

```sh
# Set machine
MACHINE = "intel-corei7-64"

# This install oneAPI packages in the target image.
IMAGE_INSTALL:append = " setup-intel-oneapi-env"
IMAGE_INSTALL:append = " onevpl"
IMAGE_INSTALL:append = " intel-oneapi-compiler intel-oneapi-mkl intel-oneapi-ipp"

```

## Step 2: Build a Yocto Image with oneAPI Packages

Run BitBake to build your image with oneAPI packages. To build the sato image, for example, run:
```sh
bitbake core-image-sato
```

## Step 3: Verify the Yocto Image with oneAPI Packages

Verify that oneAPI packages were built successfully.
Run the following command:
```sh
oe-pkgdata-util list-pkgs | grep intel-oneapi
```

If the image was built successfully, it will return the list of packages as below:
```sh
intel-oneapi-compiler
intel-oneapi-compiler-dbg
intel-oneapi-compiler-dev
intel-oneapi-ipp
intel-oneapi-ipp-dbg
intel-oneapi-ipp-dev
intel-oneapi-mkl
intel-oneapi-mkl-dbg
intel-oneapi-mkl-dev
setup-intel-oneapi-env
setup-intel-oneapi-env-dbg
setup-intel-oneapi-env-dev
```
