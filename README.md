# seec-deb-pkg
Debian packaging for SeeC.

This repository holds the files used to create Debian packages for SeeC.
SeeC's source package also contains the source for some dependencies, namely LLVM, SeeC-Clang, and wxWidgets.
These libraries are all built as part of SeeC's build process, and then statically linked into SeeC's binaries.
We don't use the standard wxWidgets package because SeeC is a C++11 project,
thus it requires wxWidgets to be built with `-std=c++11` also.

This repository uses submodules to retrieve the source code for our dependencies, namely:
```
seec/src/llvm
seec/src/seec
seec/src/wxWidgets
```

To clone the repository and the submodules you can use:  
`$` `git` `clone` `--recursive` `https://github.com/seec-team/seec-deb-pkg.git`

If you have already cloned the repository, you can initialize and/or update the submodules using:  
`git` `submodule` `update` `--init` `--recursive`


## Build binary packages for local testing

In the root directory, we simply run:  
`$` `make` `SEEC_VERSION=0.27.0`  
Replacing the `0.27.0` with whichever version number is appropriate.


## Build source package

`$` `make` `srcpackage` `SEEC_VERSION=0.27.0`  


## Clean the build

`$` `make` `clean`  

