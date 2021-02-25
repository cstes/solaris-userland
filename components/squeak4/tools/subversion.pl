#!/usr/bin/perl

#
# script to replace the subversion version by $(SVN_REV)
#

while (<>) {
	s/3797/\$(SVN_REV)/;
	print $_;
}

