# seec-deb-pkg
Debian packaging for SeeC.

This repository holds the files used to create Debian packages for SeeC.
SeeC's source package also contains the source for some dependencies, namely LLVM, SeeC-Clang, and wxWidgets.
These libraries are all built as part of SeeC's build process, and then statically linked into SeeC's binaries.
We don't use the standard wxWidgets package because SeeC is a C++11 project,
thus it requires wxWidgets to be built with `-std=c++11` also.

This repository contains a folder named `seec`, containing the `debian` folder and a `Makefile`.
Within the `seec` folder, we must create a `src` folder containing the source code for SeeC, LLVM (including SeeC-Clang), and wxWidgets.
The entire structure should look like this:

```
seec/
+-- debian/
+-- src/
    +-- llvm/
    +-- seec/
    +-- wxWidgets/
+-- Makefile
create_orig.sh
LICENSE
README.md
```

The `create_orig.sh` script is a simple helper to create an appropriate "upstream" source package from the `seec` directory.
In the root directory, we simply run:  
`$` `./create_orig.sh` `0.26.0`  
Replacing the `0.26.0` with whichever version number is appropriate.

