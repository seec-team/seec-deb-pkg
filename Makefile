ROOTDIR=$(CURDIR)

binpackage : seec_$(SEEC_VERSION).orig.tar.gz
	cd $(ROOTDIR)/seec && debuild -us -uc

srcpackage : seec_$(SEEC_VERSION).orig.tar.gz
	cd $(ROOTDIR)/seec && debuild -S

seec_$(SEEC_VERSION).orig.tar.gz :
	cd $(ROOTDIR) && ./create_orig.sh $(SEEC_VERSION)

clean :
	cd $(ROOTDIR)/seec && debuild clean && rm -rf temp/

