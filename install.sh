#!/bin/sh

WORKDIR=/home/serpentx/Desktop/NOTES
NOTES_TAR=NOTES_9.0.1_LINUX_DI_EN.tar
NOTES_FIX_TAR=notes901FP7_linuxUb.tar

tar -xvf $WORKDIR/$NOTES_TAR > /dev/null

# IBM-NOTES unpack
ar x ibm-notes-9.0.1.i586.deb
rm ibm-notes-9.0.1.i586.deb
tar xzf control.tar.gz

# Change dependencies Lotus Notes
#sed -i 's/\<coreutils\>//g' control
sed -i 's/coreutils,//g' control
sed -i 's/gdb,//g' control
sed -i 's/bash,//g' control
sed -i 's/unzip,//g' control
sed -i 's/procps,//g' control
sed -i 's/grep,//g' control
sed -i 's/sed,//g' control
sed -i 's/libcupsys2,//g' control
#sed -i 's/\<ttf-xfree86-nonfree\>//g' control

# Build ibm-notes deb package
tar c postinst postrm preinst prerm md5sums control | gzip -c > control.tar.gz
ar rcs ibm-notes-9.0.1.i586.deb debian-binary control.tar.gz data.tar.gz

# clean ibm-notes
rm postinst postrm preinst prerm md5sums control control.tar.gz debian-binary

# IBM-SAMETIME unpack
ar x ibm-sametime-9.0.1.i586.deb
rm ibm-sametime-9.0.1.i586.deb
tar xzf control.tar.gz

# Change dependencies ibm-sametime
#sed -i 's/iproute//g' control
sed -i 's/, iproute//g' control


# Build ibm-sametime deb package
tar c postinst postrm preinst prerm md5sums control | gzip -c > control.tar.gz
ar rcs ibm-sametime-9.0.1.i586.deb debian-binary control.tar.gz data.tar.gz

# clean ibm-notes
rm postinst postrm preinst prerm md5sums control control.tar.gz debian-binary smartupgrade.sh license.tar data.tar.gz shlibs

echo 'SUCCESS REBUILD DEB PACKAGES!'

# /etc/apt/sources.list
sed -i 's/us.ubuntu/old-releases/g' /etc/apt/sources.list
echo 'deb http://old-releases.ubuntu.com/ubuntu/ raring main restricted universe multiverse' >> /etc/apt/sources.list

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libart-2.0-2:i386 libasound2:i386 libatk1.0-0:i386 libavahi-client3:i386 libavahi-common3:i386 libavahi-glib1:i386 libbonobo2-0:i386 libbonoboui2-0:i386 libc6:i386 libcairo2:i386 libcanberra0:i386 libcomerr2:i386 libcups2:i386 libdbus-1-3:i386 libdbus-glib-1-2:i386 libexpat1:i386 libffi6:i386 libfontconfig1:i386 libfreetype6:i386 libgail18:i386 libgcc1:i386 libgconf-2-4:i386 libgdk-pixbuf2.0-0:i386 libglib2.0-0:i386 libgnome2-0:i386 libgnomecanvas2-0:i386 libgnome-keyring0:i386 libgnomeui-0:i386 libgnomevfs2-0:i386 libgpg-error0:i386 libgssapi-krb5-2:i386 libgtk2.0-0:i386 libhunspell-1.3-0:i386 libice6:i386 libjpeg62:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-3:i386 libkrb5support0:i386 libltdl7:i386 libnspr4:i386 libnspr4-0d:i386 libnss3:i386 libnss3-1d:i386 libogg0:i386 liborbit2:i386 libp11-kit0:i386 libpam0g:i386 libpango1.0-0:i386 libpcre3:i386 libpixman-1-0:i386 libpng12-0:i386 libpopt0:i386 libselinux1:i386 libsm6:i386 libstdc++6:i386 libtasn1-6:i386 libtdb1:i386 libuuid1:i386 libvorbis0a:i386 libvorbisfile3:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxcb-render0:i386 libxcb-shm0:i386 libxcomposite1:i386 libxcursor1:i386 libxdamage1:i386 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxft2:i386 libxi6:i386 libxinerama1:i386 libxml2:i386 libxrandr2:i386 libxrender1:i386 libxss1:i386 libxt6:i386 libxtst6:i386 zlib1g:i386 unity-gtk2-module:i386 libcanberra-gtk-module:i386 libxss1:i386 gtk2-engines-murrine:i386 p11-kit-modules:i386 libp11-kit-gnome-keyring:i386 ttf-xfree86-nonfree gdb iproute2 libgconf2-4:i386 libxkbfile1:i386 lib32ncurses5 lib32z1 libidl-2-0:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 libasound2-plugins:i386 libgail-common:i386 overlay-scrollbar-gtk2 libgnome-desktop-3-12:i386 libatk-adaptor:i386 libgcrypt20:i386 libgnutls30:i386 

sudo apt-get update; sudo apt-get install libgnomeprint2.2-0:i386 libgnomeprintui2.2-0:i386 libbonobo2-0:i386 libbonoboui2-0:i386 libgconf2-4:i386 libgnome-desktop-2-17:i386 libgnomevfs2-bin:i386 libgnomeui-0:i386 libjpeg62:i386 libpam0g:i386 libxkbfile1:i386 ttf-xfree86-nonfree t1-xfree86-nonfree -y 
sudo apt-get install liborbit2:i386 libpng12-0:i386 libxp6:i386 libxss1:i386 libxt6:i386 libxtst6:i386 -y

# install ibm-notes ibm-sametime
sudo dpkg -i ibm-notes*
sudo dpkg -i ibm-sametime*

# FIXPACK
tar xvf $NOTES_FIX_TAR
sudo rm ibm_notes_fixpack.sh
sudo dpkg -i ibm_notes_fixpack*
