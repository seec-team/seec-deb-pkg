# Makefile for SeeC with dependencies.
# Version 0.26.0~pr2
# Matthew Heinsen Egan <matthew.heinsen.egan@gmail.com>
# 2015-02-13

RM    = rm
ECHO  = echo
SHELL = /bin/sh

.SILENT :

PREFIX? = /usr

ICU_INSTALL = /usr

DIR_TEMP_BUILD   = build
DIR_TEMP_INSTALL = temp

DEB_HOST_MULTIARCH := $(shell dpkg-architecture -qDEB_HOST_MULTIARCH)

all : $(DIR_TEMP_BUILD)/seec/tools/seec-cc/seec-cc

install : $(DIR_TEMP_BUILD)/seec/tools/seec-cc/seec-cc
	$(ECHO) install seec
	cd $(DIR_TEMP_BUILD)/seec && make install DESTDIR=$(CURDIR)/debian/tmp/usr

clean :
	$(ECHO) cleaning temporary directories
	-$(RM) -fr $(DIR_TEMP_BUILD)

#
# SeeC - compile if seec-cc has not been built.
#
$(DIR_TEMP_BUILD)/seec/tools/seec-cc/seec-cc : $(DIR_TEMP_INSTALL)/wxWidgets/bin/wx-config $(DIR_TEMP_INSTALL)/llvmtemp/bin/llvm-config $(DIR_TEMP_BUILD)/seec/Makefile
	$(ECHO) build seec
	cd $(DIR_TEMP_BUILD)/seec && make

#
# SeeC - generate Makefile using cmake (if it is not present).
#
$(DIR_TEMP_BUILD)/seec/Makefile :
	$(ECHO) configure seec
	mkdir -p $(DIR_TEMP_BUILD)/seec && cd $(DIR_TEMP_BUILD)/seec && cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_DIR=$(CURDIR)/$(DIR_TEMP_INSTALL)/llvmtemp/share/llvm/cmake -DICU_INSTALL=$(ICU_INSTALL) -DWX_INSTALL=$(CURDIR)/$(DIR_TEMP_INSTALL)/wxWidgets -DWX_TOOLCHAIN=gtk2-unicode-static-3.0 -DMULTIARCH=$(DEB_BUILD_MULTIARCH) -DCMAKE_INSTALL_PREFIX:PATH=$(PREFIX) $(CURDIR)/src/seec

#
# LLVM - compile if llvm-config is not installed.
#
$(DIR_TEMP_INSTALL)/llvmtemp/bin/llvm-config : $(DIR_TEMP_BUILD)/llvmtemp/Makefile
	$(ECHO) build llvm
	cd $(DIR_TEMP_BUILD)/llvmtemp && make -j4 ONLY_TOOLS="clang" && make install ONLY_TOOLS="clang" DESTDIR=$(CURDIR)/$(DIR_TEMP_INSTALL)

#
# LLVM - configure if Makefile is not present.
#
$(DIR_TEMP_BUILD)/llvmtemp/Makefile : 
	$(ECHO) configure llvm
	mkdir -p $(DIR_TEMP_BUILD)/llvmtemp && cd $(DIR_TEMP_BUILD)/llvmtemp && $(CURDIR)/src/llvm/configure --enable-cxx11 --enable-optimized --prefix=/llvmtemp

#
# wxWidgets - compile if wx-config is not installed.
#
$(DIR_TEMP_INSTALL)/wxWidgets/bin/wx-config : $(DIR_TEMP_BUILD)/wx/Makefile
	$(ECHO) build wx
	cd $(DIR_TEMP_BUILD)/wx && make -j4 && make install DESTDIR=$(CURDIR)/$(DIR_TEMP_INSTALL)

#
# wxWidgets - configure if Makefile is not present.
#
$(DIR_TEMP_BUILD)/wx/Makefile : 
	$(ECHO) configure wx
	mkdir -p $(DIR_TEMP_BUILD)/wx && cd $(DIR_TEMP_BUILD)/wx && $(CURDIR)/src/wxWidgets/configure --disable-shared --enable-webview --without-regex --with-libjpeg=sys --with-libpng=sys --without-libtiff --without-gnomeprint --enable-stl CFLAGS="-fPIC" CXXFLAGS="-std=c++11 -fPIC" --prefix=/wxWidgets

