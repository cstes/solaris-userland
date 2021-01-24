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
# Copyright 2020, 2021 David Stes
# 

#
# Package Makefile for "GNU Smalltalk" or "gst"
#
# see http://smalltalk.gnu.org for more info
#
# original author of GNU Smalltalk was Steve Byrne (then at Sunsoft)
#
# "The Smalltalk Report" June 1992 Vol I Number 8 issue by Steve Byrne
# discusses the use of Emacs as a Smalltalk class browser
#
# recent emacs (25+) has integrated Smalltalk support from ELPA
# M-x package-install smalltalk-mode
#
# but we still build the package with Emacs support, and split it into
# core components and everything else, so that gnu-smalltalk-core can be
# installed without Emacs or without GTK (GNOME) support
# the VisualGST or gst-browser requires gtk2
#

# gst can be built 64-bit but seems to have an issue
# ../scripts/Package.st:31: Abort in 64-bit case
# still under investigation (the gst itself works in 64bit)
# a 32bit version makes most sense as GNU st uses 'int' (4 bytes) as object ID
# gst requires a lot of GNU tools like gcc (compiles only with gcc), gawk ...
# also  libtool pkg-config must be installed for configure and build to work

BUILD_BITS=32
COMPILER=gcc

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gnu-smalltalk
COMPONENT_VERSION=	3.2.91
COMPONENT_REVISION=	1
COMPONENT_SUMMARY=	GNU Smalltalk
COMPONENT_PROJECT_URL=	http://smalltalk.gnu.org

COMPONENT_SRC=		smalltalk-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:13a7480553c182dbb8092bd4f215781b9ec871758d1db7045c2d8587e4d1bef9
WEBSITE=		https://alpha.gnu.org/gnu/smalltalk/
COMPONENT_ARCHIVE_URL=	$(WEBSITE)/$(COMPONENT_ARCHIVE)
#COMPONENT_SIG_URL=	$(WEBSITE)/$(COMPONENT_ARCHIVE).sig

TEST_TARGET= $(NO_TESTS)

include $(WS_MAKE_RULES)/common.mk

# GNU smalltalk is unable to find the GMP header files so add to CPPFLAGS
# the GNU smalltalk configure script looks for ${lispdir}/site-start.d
# but that directory is not delivered by the Solaris gnu-emacs package
# setting lispstartdir does not help because it seems ignored when crosscompile

CPPFLAGS +=		-I/usr/include/gmp

CONFIGURE_OPTIONS +=    --with-gmp
CONFIGURE_OPTIONS +=    --with-emacs
CONFIGURE_OPTIONS +=    --with-lispdir=/usr/share/emacs/site-lisp
# CONFIGURE_OPTIONS +=    --with-lispstartdir=/usr/share/emacs/site-lisp

# the libtool from gst is not working with Solaris /usr/bin/nm
CONFIGURE_ENV +=	NM='/usr/gnu/bin/nm'
CONFIGURE_ENV +=	MAKE='/usr/bin/gmake'

# the default seems to install non-stripped
COMPONENT_INSTALL_TARGETS=	install-strip

# Build dependencies
REQUIRED_PACKAGES += text/texinfo
REQUIRED_PACKAGES += editor/gnu-emacs
REQUIRED_PACKAGES += build/automake
REQUIRED_PACKAGES += x11/library/mesa

# Auto-generated contents below.
REQUIRED_PACKAGES += database/sqlite-3
REQUIRED_PACKAGES += library/database/gdbm
REQUIRED_PACKAGES += library/desktop/gtk2
REQUIRED_PACKAGES += library/expat
REQUIRED_PACKAGES += library/glib2
REQUIRED_PACKAGES += library/gmp
REQUIRED_PACKAGES += library/gnutls-3
REQUIRED_PACKAGES += library/libffi
REQUIRED_PACKAGES += library/libsigsegv
REQUIRED_PACKAGES += library/libtool/libltdl
REQUIRED_PACKAGES += library/readline
REQUIRED_PACKAGES += library/zlib
REQUIRED_PACKAGES += runtime/tcl-8
REQUIRED_PACKAGES += runtime/tk-8
REQUIRED_PACKAGES += shell/ksh93
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/libc
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += x11/library/freeglut

