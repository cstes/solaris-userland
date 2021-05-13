#!/usr/bin/perl

#
# because GNU smalltalk has many modules,
# there are also many dependencies 
# in order to have a small "kernel" package
# this script is used
#
# Usage: first run pkgfmt -u on the sample manifest to remove formatting
# pkgfmt -u ../manifests/sample-manifest.p5m
# then classify the files as follows:
# ./classify.pl < ../manifests/sample-manifest.p5m
#
# finally pkgfmt the manifests again before running "gmake publish"
#

open(KERN,">>","gnu-smalltalk-kernel.p5m") || die "Can't open gnu-smalltalk-kernel.p5m";

open(EMACS,">>","gnu-smalltalk-emacs.p5m") || die "Can't open gnu-smalltalk-emacs.p5m";

open(REST,">>","gnu-smalltalk.p5m") || die "Can't open gnu-smalltalk.p5m";

while (<>) {
	if (/^#/) {
		# ignore lines that start with comment
	} elsif (/^$/) {
		# ignore empty lines
	} elsif (/license /) {
		# ignore license lines
	} elsif (/set name=/) {
		# ignore those lines
	} elsif (/dir  path=/) {
		# ignore those lines
	} elsif (/file path=/) {
		if (/\.a$/) {
			# ignore .a static libraries
			# although static libs could be useful 
		} elsif (/gst.im/) {
			print KERN $_;
		} elsif (/pkgconfig/) {
			print REST $_;
		} elsif (/libgst-gobject/) {
			print REST $_;
		} elsif (/usr\/lib\/smalltalk/) {
			print REST $_;
		} elsif (/usr\/share\/aclocal/) {
			print REST $_;
		} elsif (/usr\/share\/emacs/) {
			print EMACS $_;
		} elsif (/usr\/share\/smalltalk\/kernel/) {
			print KERN $_; 
		} elsif (/usr\/share\/smalltalk\/scripts/) {
			print KERN $_; # scripts/Package.st required
		} elsif (/usr\/share\/smalltalk/) {
			print REST $_; 
		} else {
			print KERN $_;
		}
	} elsif (/hardlink path=/) {
		if (/gst-blox/) {
			print REST $_;
		} elsif (/gst-browser/) {
			print REST $_;
		} else {
			print KERN $_;
		}
	} elsif (/link path=/) {
		if (/libgst-gobject/) {
			print REST $_;
		} elsif (/usr\/lib\/smalltalk/) {
			print REST $_;
		} elsif (/gst-reload.1/) {
# fix for problem with GNU smalltalk makefile for gst-reload.1 manpage
# link path=usr/share/man/man1/gst-reload.1 target=/scratch/clone/components/gnu-smalltalk/build/prototype/$(MACH)/usr/share/man/man1/gst-load.1
			print KERN "link path=usr/share/man/man1/gst-reload.1 target=gst-load.1\n";
		} else {
			print KERN $_;
		}
	} else {
		# unclassified files
		print $_;
	}
}

