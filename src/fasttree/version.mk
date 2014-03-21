VERSION = 2.1.7
NAME    = fasttree_$(ROLLCOMPILER)
RELEASE = 0
PKGROOT = /opt/fasttree

SOURCE_SUFFIX      = tar.gz
SOURCE_NAME        = fasttree
SRC_SUBDIR         = fasttree
SOURCE_PKG         = $(SOURCE_NAME)-$(VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)
RPM.EXTRAS         = AutoReq:No

TAR_GZ_PKGS        = $(SOURCE_PKG)
