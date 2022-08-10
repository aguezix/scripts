FROM ubuntu:bionic
ENV DISPLAY=':0'

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update && apt-get install sudo

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
   && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
   && apt-get update \
   && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
   && chmod 0440 /etc/sudoers.d/$USERNAME




COPY . /home

RUN echo 'deb http://old-releases.ubuntu.com/ubuntu/ raring main restricted universe multiverse' >> /etc/apt/sources.list

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y zip libart-2.0-2:i386 libasound2:i386 libatk1.0-0:i386 libavahi-client3:i386 \
libavahi-glib1:i386 libbonobo2-0:i386 libbonoboui2-0:i386 libc6:i386 \
libcairo2:i386 libcanberra0:i386 libcomerr2:i386 libcups2:i386 libdbus-1-3:i386 \
libdbus-glib-1-2:i386 libexpat1:i386 libffi6:i386 \
libfontconfig1:i386 libfreetype6:i386 libgail18:i386 libgcc1:i386 libgconf-2-4:i386 \
libgdk-pixbuf2.0-0:i386 libglib2.0-0:i386 libgnome2-0:i386 \
libgnomecanvas2-0:i386 libgnome-keyring0:i386 libgnomeui-0:i386 libgnomevfs2-0:i386 \
libgpg-error0:i386 libgssapi-krb5-2:i386 libgtk2.0-0:i386 libice6:i386 \
libjpeg62:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-3:i386 libkrb5support0:i386 libltdl7:i386 \
libnspr4:i386  libnss3:i386 libogg0:i386 liborbit2:i386 libp11-kit0:i386 \
libpam0g:i386 libpango1.0-0:i386 libpcre3:i386 libpixman-1-0:i386 libpopt0:i386 libselinux1:i386 \ 
libsm6:i386 libstdc++6:i386 libtasn1-6:i386 libtdb1:i386 libuuid1:i386 libvorbis0a:i386 libvorbisfile3:i386 \
libx11-6:i386 libxau6:i386 libxcb1:i386 libxcb-render0:i386 libxcb-shm0:i386 libxcomposite1:i386 libxcursor1:i386 

RUN apt install -y libxdamage1:i386 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxft2:i386 libxi6:i386 libxinerama1:i386 libxrender1:i386 libxss1:i386 libxt6:i386 libxtst6:i386 zlib1g:i386 unity-gtk2-module:i386 libxss1:i386 gtk2-engines-murrine:i386 p11-kit-modules:i386 libp11-kit-gnome-keyring:i386 ttf-xfree86-nonfree gdb iproute2 libgconf2-4:i386 libxkbfile1:i386 lib32ncurses5 lib32z1 libidl-2-0:i386 libpangox-1.0-0:i386   libgail-common:i386 overlay-scrollbar-gtk2 libatk-adaptor:i386 libgcrypt20:i386 libgnutls30:i386 

RUN apt install -y libgnome-desktop-2-17:i386 libpng12-0:i386 libxp6:i386

RUN apt install -y libgnomeprint2.2-0:i386 libgnomeprintui2.2-0:i386 libbonobo2-0:i386 libbonoboui2-0:i386 libgconf2-4:i386 libgnome-desktop-2-17:i386 libgnomevfs2-bin:i386 libgnomeui-0:i386 libjpeg62:i386 libpam0g:i386 libxkbfile1:i386 ttf-xfree86-nonfree t1-xfree86-nonfree 

RUN apt install -y liborbit2:i386 libxss1:i386 libxt6:i386 alsa-base:i386  

#RUN dpkg -i /home/ibm-notes-9.0.1.i586.deb

#RUN dpkg -i /home/ibm-sametime-9.0.1.i586.deb

#RUN dpkg -i /home/ibm_notes_fixpack-9.0.1.i586.deb

#RUN apt install firefox

USER $USERNAME 
