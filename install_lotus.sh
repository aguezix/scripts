#!/bin/sh

NOTES_TAR=NOTES_9.0.1_LINUX_RPM_EN.tar
NOTESFIX_TAR=notes901FP7_linux.tar

tar xvf $NOTES_TAR
tar xvf $NOTESFIX_TAR

sudo yum install libpangox1.0_0-1.30.1.0.0.2-6.i686 libpng0-2:1.2.59-2.i686 \
libgnome-vfs2_0-2.24.4-20.i686 libORBit2_0-2.14.19-18.i686 \
libpangoxft1.0_0-1.50.8-1.i686 libgnome2_0-2.32.1-18.i686 \
libxscrnsaver1-1.2.3-3.i686 libcups2-2.3.3op2-5.i686 \
libgtk-x11-2.0.so.0 libxt6-1.2.1-2.i686 libxp6-1.0.3-9.i686 \
libpam_misc0-1:1.5.1-3.i686 libgnomecanvas2_0-2.30.3-12.i686 \
libxkbfile-1.1.0-2.i686 libgnomeui2_0-2.24.5-14.i686 \
libcrypt1-4.4.19-2.i686 tcsh gdb

sudo rpm -i ibm_notes-9.0.1.i586.rpm
sudo rpm -i ibm_sametime-9.0.1.i586.rpm
sudo rpm -i ibm_activities-9.0.1.i586.rpm
sudo rpm -i ibm_opensocial-9.0.1.i586.rpm
sudo rpm -i ibm_feedreader-9.0.1.i586.rpm
sudo rpm -i ibm_notes_fixpack-9.0.1.i586.rpm
