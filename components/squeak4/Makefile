#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"). You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2020 David Stes
#


#
# Package Makefile for the "Classic VM" Squeak Smalltalk V4 system
# See http://squeak.org and http://squeakvm.org
#
# The squeak4 vm can only run Squeak4 images; it will not work with 
# Squeak5 images; squeak5 uses  different technology called "Cog Spur"
#
# squeak4 uses cmake and a custom configure script (not GNU autoconf)
# in order to build this package, "cmake" must be installed
#

# squeak4 can be built both in 32-bit and 64-bit 
# but generally SqueakV4 images are 32bit
# BUILD_BITS=32
COMPILER=gcc

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		squeak-4
COMPONENT_VERSION=	4.16.7
COMPONENT_PROJECT_URL=	http://www.squeak.org
COMPONENT_ARCHIVE_URL=  http://squeakvm.org

# we use a local archive file "squeak-4-3775.tar.bz" to avoid subversion
# this file was created by "svn export" of the svn revision 3775 files
SVN_REPO=		http://squeakvm.org/svn/squeak/trunk/
SVN_REV=		3775
SVN_HASH=  sha256:17f565a44201dd41aa7ae65861577c76c72097bbdae8d5a2f96c5aee1e321b63

TEST_TARGET= $(NO_TESTS)

include $(WS_MAKE_RULES)/common.mk

# squeak4 configure looks for .svn or svnversion file, but
# prep-svn.mk did a svn export and created an unversioned copy of the sources
COMPONENT_PRE_CONFIGURE_ACTION = ( echo $(SVN_REV) > $(SOURCE_DIR)/platforms/unix/svnversion )

CONFIGURE_SCRIPT= $(SOURCE_DIR)/platforms/unix/cmake/configure
CONFIGURE_OPTIONS +=	--src=$(SOURCE_DIR)/src

REQUIRED_PACKAGES += developer/build/cmake
REQUIRED_PACKAGES += developer/build/pkg-config
REQUIRED_PACKAGES += x11/library/mesa
REQUIRED_PACKAGES += system/library/dbus

# Auto-generated dependencies
REQUIRED_PACKAGES += SUNWcs
REQUIRED_PACKAGES += library/audio/pulseaudio
REQUIRED_PACKAGES += library/desktop/cairo
REQUIRED_PACKAGES += library/desktop/pango
REQUIRED_PACKAGES += library/glib2
REQUIRED_PACKAGES += library/libffi
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/freetype-2
REQUIRED_PACKAGES += system/library/libdbus
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += x11/library/libx11
REQUIRED_PACKAGES += x11/library/libxext
REQUIRED_PACKAGES += x11/library/libxrender
