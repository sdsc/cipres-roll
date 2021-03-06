ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-fasttree
VERSION        = 2.1.10
RELEASE        = 0

SRC_SUBDIR     = fasttree

SOURCE_NAME    = fasttree
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

PKGROOT        = /opt/fasttree

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
