

&lt;hr/&gt;


| **Content** | How to install GNU/Linux Operating System, Java, MySQL and other tool  |
|:------------|:-----------------------------------------------------------------------|
| **Team**    | Aishwarya.M.B, Ramnish.R, Nilesh Govindarajan (www.itech7.com)         |
| **Discussion Page** |http://groups.google.com/group/cbse065/browse_thread/thread/c32a9a8f7e810f2f|
| **Changes** | http://code.google.com/p/cbse-065/source/diff?path=/wiki/module46.wiki&format=side&r=-1 |


&lt;hr/&gt;





# Introduction #

Here you will learn how to install,configure open source platform,programming tools.

## Operating System : Linux ##
### Introduction ###

The name Linux is technically refers to the Linux kernel. But it is generally used to refer to the OS. The Kernel was written by Linus Benedict Torvalds in 1991 while studying at University of Helsinki.

His aim was to make a non-commercial version of MINIX, a UNIX like low-cost operating system made for teaching computer science (now its free and available for serious uses too).

Richard Stallman created the GNU project whose aim was to have a "complete Unix-compatible software system" composed entirely of free software.

The full operating system usually comprises components such as utilities and libraries from the GNU Project, the X Window System, the GNOME and KDE desktop environments and commonly-used applications like firefox, openoffice.

If you're interested, you can read more at [Wikipedia](http://en.wikipedia.org/wiki/Linux)

### Choosing from the pool of linux Distributions ###

Linux distributions have taken linux into wide variety of forms — from fully featured desktop and server operating systems to minimal environments (typically for use in embedded systems, or for booting from a floppy disk).

There are more than 300-400 Linux distributions avaialable.

A distribution is most simply described as a particular set of applications, kernel modules installed on top of the Linux Kernel, such that its "out-of-the-box" capabilities meet most of the needs of its particular end-user base.

### Installation ###

There are many ways to install a Linux distribution.

The most common method of installing Linux is by booting from a CD-ROM or DVD that contains the installation program and installable software. Such a CD can be burned from a downloaded ISO image, purchased alone for a low price, provided as a cover disk with a magazine, shipped for free by request, or obtained as part of a box set that may also include manuals and additional commercial software.

New users tend to begin by partitioning a hard drive in order to keep their previously-installed operating system. The Linux distribution can then be installed on its own separate partition without affecting previously saved data.

In industries, because installtion from optical media is slow, network based installation is used. They have a server in which the OS is installed once using optical media. Later it is configured to serve the OS preset (called kickstart by Redhat, Fedora) and the instalation files, etc. Other machines if support PXE Booting (Network boot via BIOS) get connected to the server and execute the installation preset. The OS is installed within minutes depending on Link speed and selected software.


#### Ubuntu Installation ####
#### Fedora Installation ####

## Java Development Kit : openjdk,netbeans ##
### Introduction ###
### Ubuntu,Kubuntu,xbuntu,Debian ###
On the command line, type:
|#sudo apt-get install openjdk-6-jdk netbeans|
|:-------------------------------------------|

### Fedora ###
On the command line, type:
|#sudo yum install java-openjdk netbeans|
|:--------------------------------------|

## MySQL : mysql-server ##
### Introduction ###

### Ubuntu,Kubuntu,xbuntu,debian ###
On the command line, type:
|#sudo apt-get install mysql mysql-server|
|:---------------------------------------|

### Fedora ###
On the command line, type:
|#sudo yum install mysql mysql-server|
|:-----------------------------------|