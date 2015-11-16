| **Content** | **Utility Software** Compression tools, Anti Virus, SPAM Filters, File Management tools, Archiving, Backups, Time snapshots of disk and Disk Management tools |
|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Team**    | J T D'souza                                                                                                                                                   |
| **Discussion Page** | http://groups.google.com/group/cbse065/browse_thread/thread/afae959fd217d881                                                                                  |
| **Changes** | http://code.google.com/p/cbse-065/source/diff?path=/wiki/module8.wiki&format=side&r=-1                                                                        |
| **Old Version List** | http://code.google.com/p/cbse-065/source/list?path=/wiki/module8.wiki                                                                                         |



&lt;hr/&gt;





# Introduction #

Standard utilities available on a GNU/Linux OS


# Details #

This module provides an introduction to the standard utilities available on a GNU/Linux OS installation. We shall cover the features of each utility and the command line syntax for doing typical administrative tasks.

We shall be using debian distribution named Lenny. However what we learn here will be applicable on almost any GNU/Linux distribution like Fedora, Suse, Mandriva, Ubuntu, Slacware etc. Embedded distributions like DSL, MontaVista, Emdebian etc, may not have all the utilities and even included utilities will have several features missing.

Utilities are small command line programs used to do mundane installation, maintenance, configuration and testing tasks.
These programs can be divided into a few broad categories
  1. Shell
  1. File, Shell and Text utils
  1. Disk utils
  1. Network utils
  1. Search utils
  1. Install utils
  1. Editors
  1. Others

Before we proceed any further we will take a look at that most profound creation of all - man. No it is not man from hu-man or wo-man, but man from manual and will beat super-man. It is your mana from heaven and will save you from disaster always. Well at least from disaster on the computer, where quite often even superman like powers fail.
man is a shortform for manual and gives you a brief description of the programme and it's usage syntax for the innumerable options available with every utility.
The syntax for man is man `<command>`
Thus typing
man man
will, in a bout of self glorification, tell you all about itself and give you the details of what the man command does and it's usage options. Although man itself has several options just typing man `<command>` is sufficient for most purposes.

So before you go and type rm and wipe your disk clean, please type man rm to understand the implications of your action. Well even if you are not going to wipe your disk clean do use man - especially when this textbook gets boring.

The usage syntax for every utility listed below is available with man. Infact this module is a printed version of each utility's manpage with occasional changes.

## Fileutils, shellutils and textutils ##

These utilities are available in the coreutils package in Debain  / Redhat and their derivatives.  Previously a set of three packages,  GNU fileutils, shellutils and textutils, implemented the core set of GNU utilities.

on apt based distributions like debian, Ubuntu, Knoppix etc
apt-get install coreutils
will install coreutils

On rpm based distros like Redhat, Fedora, etc
rpm -i coreutils
will install coreutils

And by the way, you just learn't how to install a package on debian and derivative distros and Redhat and derivative distros in the above two paras.

In the previous section on shells, you have seen how output from one command is piped to a second (or third or more) command. We can pipe the output of a utility to another one to ease tasks or realise more complex tasks.
For example ls gives you a long list if you have many files and the output scrolls off the top of your screen. So you use ls | less which will give you a scrollable output.
Or ls -al | grep ^d which will only list directories.

For complex repetitive tasks one can write a bash script.

### basename ###
Strip directory and suffix from filenames
Examples

> basename /usr/bin/sort
> > Output "sort".


> basename include/stdio.h .h
> > Output "stdio".

### cat ###
Concatenate FILE(s), or standard input, to standard output.


> -A, --show-all
> > equivalent to -vET


> -b, --number-nonblank
> > number nonempty output lines


> -e     equivalent to -vE

> -E, --show-ends
> > display $ at end of each line


> -n, --number
> > number all output lines


> -s, --squeeze-blank
> > suppress repeated empty output lines


> -t     equivalent to -vT

> -T, --show-tabs
> > display TAB characters as ^I


> -u     (ignored)

> -v, --show-nonprinting
> > use ^ and M- notation, except for LFD and TAB


> --help display this help and exit

> --version
> > output version information and exit


> With no FILE, or when FILE is -, read standard input.

EXAMPLES

> cat /usr/share/doc/manpages/README.Debian

> will give you details of the debian GNU/Linux manual pages

### chgrp ###
Change  the group of each FILE to GROUP.  With --reference, change the group of each FILE to that of RFILE.
> -c, --changes
> > like verbose but report only when a change is made


> --dereference
> > affect the referent of each symbolic link (this is the default),  rather  than  the  symbolic link itself


> -h, --no-dereference
> > affect  each  symbolic  link  instead of any referenced file (useful only on systems that can change the ownership of a symlink)


> --no-preserve-root
> > do not treat / specially (the default)


> --preserve-root
> > fail to operate recursively on /


> -f, --silent, --quiet
> > suppress most error messages


> --reference=RFILE
> > use RFILE's group rather than specifying a GROUP value


> -R, --recursive
> > operate on files and directories recursively


> -v, --verbose
> > output a diagnostic for every file processed


> The following options modify how a hierarchy is traversed when the -R option is also specified. If more than one is specified, only the final one takes effect.

> -H     if a command line argument is a symbolic link to a directory, traverse it

> -L     traverse every symbolic link to a directory encountered

> -P     do not traverse any symbolic links (default)

> --help display this help and exit

> --version
> > output version information and exit

EXAMPLES

> chgrp staff /u
> > Change the group of /u to "staff".


> chgrp -hR staff /u
> > Change the group of /u and subfiles to "staff".

### chmod ###

This manual page documents the GNU version of chmod.  chmod changes the file mode bits of each given file according to mode, which can be either a symbolic representation of  changes to make, or an octal number representing the bit pattern for the new mode bits.

The  format  of a symbolic mode is [ugoa...][[+-=][perms...]...], where perms is either zero or more letters from the set rwxXst, or a single letter from the set ugo.  Multiple symbolic  modes  can  be given, separated by commas.

A combination of the letters ugoa controls which users' access to the file will be changed: the user who owns it (u), other users in the file's group (g), other users not in the file's  group  (o),  or all  users (a).  If none of these are given, the effect is as if a were given, but bits that are set in the umask are not affected.

The operator + causes the selected file mode bits to be added to the existing file mode bits of each file;  -  causes them to be removed; and = causes them to be added and causes unmentioned bits to be removed except that a directory's unmentioned set user and group ID bits are not affected.

The letters rwxXst select file mode bits for the affected users: read (r), write  (w),  execute  (or search for directories) (x), execute/search only if the file is a directory or already has execute permission for some user (X), set user or group ID on execution (s), restricted deletion flag or sticky bit (t).  Instead of one or more of these letters, you can specify exactly one of the letters ugo: the permissions granted to the user who owns the file (u), the  permissions  granted  to  other users who are members of the file's group (g), and the permissions granted to users that are in neither of the two preceding categories (o).

A numeric mode is from one to four octal digits (0-7), derived by adding up the bits with values  4, 2,  and 1.  Omitted digits are assumed to be leading zeros.  The first digit selects the set user ID (4) and set group ID (2) and restricted deletion or sticky (1) attributes.  The second digit selects permissions  for the user who owns the file: read (4), write (2), and execute (1); the third selects permissions for other users in the file's group, with the same values;  and  the  fourth  for  other users not in the file's group, with the same values.

chmod  never  changes  the  permissions of symbolic links; the chmod system call cannot change their permissions. This is not a problem since the permissions of symbolic links are never used. However, for each symbolic link listed on the command line, chmod changes the permissions of the pointed-to file. In contrast, chmod ignores symbolic links encountered during  recursive  directory traversals.

**SETUID AND SETGID BITS**

> chmod clears the set-group-ID bit of a regular file if the file's group ID does not match the user's effective group ID or one of the user's supplementary group IDs, unless the user has appropriate privileges. Additional restrictions may cause the set-user-ID and set-group-ID bits of MODE or RFILE to be ignored.  This behavior depends on the policy and functionality of the underlying  chmod system call.  When in doubt, check the underlying system behavior.
> chmod preserves a directory's set-user-ID and set-group-ID bits unless you explicitly specify otherwise. You can set or clear the bits with symbolic modes like u+s and g-s, and you can set (but  not clear) the bits with a numeric mode.

**RESTRICTED DELETION FLAG OR STICKY BIT**
> The restricted deletion flag or sticky bit is a single bit, whose interpretation depends on the file
> type.  For directories, it prevents unprivileged users from removing  or  renaming  a  file  in  the
> directory unless they own the file or the directory; this is called the restricted deletion flag for
> the directory, and is commonly found on world-writable directories like /tmp.  For regular files  on
> some  older  systems, the bit saves the program's text image on the swap device so it will load more
> quickly when run; this is called the sticky bit.

OPTIONS
> Change the mode of each FILE to MODE.

> -c, --changes
> > like verbose but report only when a change is made


> --no-preserve-root
> > do not treat / specially (the default)


> --preserve-root
> > fail to operate recursively on /


> -f, --silent, --quiet
> -v, --verbose
> > output a diagnostic for every file processed


> --reference=RFILE
> > use RFILE's mode instead of MODE values


> -R, --recursive
> > change files and directories recursively


> --help display this help and exit

> --version
> > output version information and exit


> Each MODE is of the form `[ugoa]*([-+=]([rwxXst]*|[ugo]))+`.

### chown ###
This  manual page documents the GNU version of chown.  chown changes the user and/or group ownership of each given file. If only an owner (a user name or numeric user ID) is given, that user is made the  owner of each given file, and the files' group is not changed.  If the owner is followed by a colon and a group name (or numeric group ID), with no spaces between them, the  group ownership of the files is changed as well. If a colon but no group name follows the user name, that user is made the owner of the files and the group of the files is changed to that user's login group. If the colon and group are given, but the owner is omitted, only the group of the files is changed; in this   case, chown performs the same function as chgrp.  If only a colon is given, or if the entire operand is empty, neither the owner nor the group is changed.

OPTIONS
> Change  the  owner  and/or  group  of each FILE to OWNER and/or GROUP.  With --reference, change the
> owner and group of each FILE to those of RFILE.

> -c, --changes
> > like verbose but report only when a change is made


> --dereference
> > affect the referent of each symbolic link (this is the default),  rather  than  the  symbolic
> > link itself


> -h, --no-dereference
> > affect  each  symbolic  link  instead of any referenced file (useful only on systems that can
> > change the ownership of a symlink)


> --from=CURRENT\_OWNER:CURRENT\_GROUP
> > change the owner and/or group of each file only if its current owner and/or group match those
> > specified here.  Either may be omitted, in which case a match is not required for the omitted
> > attribute.


> --no-preserve-root
> > do not treat / specially (the default)


> --preserve-root
> > fail to operate recursively on /


> -f, --silent, --quiet
> > suppress most error messages


> --reference=RFILE
> > use RFILE's owner and group rather than specifying OWNER:GROUP values


> -R, --recursive
> > operate on files and directories recursively


> -v, --verbose
> > output a diagnostic for every file processed


> The following options modify how a hierarchy is traversed when the -R option is also specified.   If
> more than one is specified, only the final one takes effect.

> -H     if a command line argument is a symbolic link to a directory, traverse it

> -L     traverse every symbolic link to a directory encountered

> -P     do not traverse any symbolic links (default)

> --help display this help and exit

> --version
> > output version information and exit


> Owner is unchanged if missing.  Group is unchanged if missing, but changed to login group if implied by a : following a symbolic OWNER.  OWNER and GROUP may be numeric as well as symbolic.

EXAMPLES
> chown root /u
> > Change the owner of /u to "root".


> chown root:staff /u
> > Likewise, but also change its group to "staff".


> chown -hR root /u
> > Change the owner of /u and subfiles to "root".


### chroot ###

> Run COMMAND with root directory set to NEWROOT.

> --help display this help and exit

> --version
> > output version information and exit


> If no command is given, run `${SHELL} -i` (default: /bin/sh).

### cksum ###
> Print CRC checksum and byte counts of each FILE.

> --help display this help and exit

> --version
> > output version information and exit
EXAMPLES

> cksum /bin/ls
> 3265941495 92312 /bin/ls
> displays the crc checksum 3265941495 and byte count 92312 of /bin/ls

### comm ###
> Compare sorted files FILE1 and FILE2 line by line.

> With no options, produce three-column output.  Column one contains lines unique to FILE1, column two
> contains lines unique to FILE2, and column three contains lines common to both files.

> -1     suppress lines unique to FILE1

> -2     suppress lines unique to FILE2

> -3     suppress lines that appear in both files

> --help display this help and exit

> --version
> > output version information and exit


### cp ###
Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.


> Mandatory arguments to long options are mandatory for short options too.

> -a, --archive
> > same as -dpR


> --backup[=CONTROL]
> > make a backup of each existing destination file


> -b     like --backup but does not accept an argument

> --copy-contents
> > copy contents of special files when recursive


> -d     same as --no-dereference --preserve=links

> -f, --force
> > if an existing destination file cannot be opened, remove it and try again


> -i, --interactive
> > prompt before overwrite


> -H     follow command-line symbolic links in SOURCE

> -l, --link
> > link files instead of copying


> -L, --dereference
> > always follow symbolic links in SOURCE


> -P, --no-dereference
> > never follow symbolic links in SOURCE


> -p     same as --preserve=mode,ownership,timestamps

> --preserve[=ATTR\_LIST]
> > preserve  the  specified  attributes  (default: mode,ownership,timestamps), if possible additional attributes: context, links, all


> --no-preserve=ATTR\_LIST
> > don't preserve the specified attributes


> --parents
> > use full source file name under DIRECTORY


> -R, -r, --recursive
> > copy directories recursively


> --remove-destination
> > remove each existing destination file before attempting to open it (contrast with --force)


> --sparse=WHEN
> > control creation of sparse files


> --strip-trailing-slashes
> > remove any trailing slashes from each SOURCE argument


> -s, --symbolic-link
> > make symbolic links instead of copying


> -S, --suffix=SUFFIX
> > override the usual backup suffix


> -t, --target-directory=DIRECTORY
> > copy all SOURCE arguments into DIRECTORY


> -T, --no-target-directory
> > treat DEST as a normal file


> -u, --update
> > copy only when the SOURCE file is newer than the destination file  or  when  the  destination
> > file is missing


> -v, --verbose
> > explain what is being done


> -x, --one-file-system
> > stay on this file system


> --help display this help and exit

> --version
> > output version information and exit


> By default, sparse SOURCE files are detected by a crude heuristic and the corresponding DEST file is
> made sparse as well.  That is the behavior selected by --sparse=auto.   Specify  --sparse=always  to
> create  a  sparse  DEST file whenever the SOURCE file contains a long enough sequence of zero bytes.
> Use --sparse=never to inhibit creation of sparse files.

> The backup suffix is ~, unless set with --suffix or  SIMPLE\_BACKUP\_SUFFIX.   The  version  control
> method  may be selected via the --backup option or through the VERSION\_CONTROL environment variable.
> Here are the values:

> none, off
> > never make backups (even if --backup is given)


> numbered, t
> > make numbered backups


> existing, nil
> > numbered if numbered backups exist, simple otherwise


> simple, never
> > always make simple backups


> As a special case, cp makes a backup of SOURCE when the force  and  backup  options  are  given  and
> SOURCE and DEST are the same name for an existing, regular file.

EXAMPLES
> cp ~/somefile /bkp/
> > copies somefile from the users home directory to the bkp directory

> cp -rvp ~/ /bkp/
> > copy recursively everything from the users home dirctory to the bkp directory, displaying what is going on, and preserving permissions.

### csplit ###

> Output  pieces  of FILE separated by PATTERN(s) to files "xx00", "xx01", ..., and output byte counts
> > of each piece to standard output.


> Mandatory arguments to long options are mandatory for short options too.

> -b, --suffix-format=FORMAT
> > use sprintf FORMAT instead of %02d


> -f, --prefix=PREFIX
> > use PREFIX instead of 'xx'


> -k, --keep-files
> > do not remove output files on errors


> -n, --digits=DIGITS
> > use specified number of digits instead of 2


> -s, --quiet, --silent
> > do not print counts of output file sizes


> -z, --elide-empty-files
> > remove empty output files


> --help display this help and exit

> --version
> > output version information and exit


> Read standard input if FILE is -.  Each PATTERN may be:

> INTEGER
> > copy up to but not including specified line number


> /REGEXP/[OFFSET](OFFSET.md)
> > copy up to but not including a matching line


> %REGEXP%[OFFSET](OFFSET.md)
> > skip to, but not including a matching line


> `{INTEGER}`
> > repeat the previous pattern specified number of times


> `{*}`    repeat the previous pattern as many times as possible

> A line OFFSET is a required "+" or "-" followed by a positive integer.

### cut ###
> Print selected parts of lines from each FILE to standard output.

> Mandatory arguments to long options are mandatory for short options too.

> -b, --bytes=LIST
> > select only these bytes


> -c, --characters=LIST
> > select only these characters


> -d, --delimiter=DELIM
> > use DELIM instead of TAB for field delimiter


> -f, --fields=LIST
> > select  only  these fields;  also print any line that contains no delimiter character, unless
> > the -s option is specified


> -n     (ignored)

> --complement
> > complement the set of selected bytes, characters or fields.


> -s, --only-delimited
> > do not print lines not containing delimiters


> --output-delimiter=STRING
> > use STRING as the output delimiter the default is to use the input delimiter


> --help display this help and exit

> --version
> > output version information and exit


> Use one, and only one of -b, -c or -f.  Each LIST is made up of one range, or many ranges  separated
> by  commas.   Selected  input  is  written in the same order that it is read, and is written exactly
> once.  Each range is one of:

> N      N'th byte, character or field, counted from 1

> N-     from N'th byte, character or field, to end of line

> N-M    from N'th to M'th (included) byte, character or field

> -M     from first to M'th (included) byte, character or field

> With no FILE, or when FILE is -, read standard input.


### date ###
> Display the current time in the given FORMAT, or set the system date.

> -d, --date=STRING
> > display time described by STRING, not "now"


> -f, --file=DATEFILE
> > like --date once for each line of DATEFILE


> -r, --reference=FILE
> > display the last modification time of FILE


> -R, --rfc-2822
> > output date and time in RFC 2822 format.  Example: Mon, 07 Aug 2006 12:34:56 -0600


> --rfc-3339=TIMESPEC
> > output  date  and  time in RFC 3339 format.  TIMESPEC="date", "seconds", or "ns" for date and
> > time to the indicated precision.  Date and time components are separated by a  single  space:
> > 2006-08-07 12:34:56-06:00


> -s, --set=STRING
> > set time described by STRING


> -u, --utc, --universal

> --help display this help and exit

> --version
> > output version information and exit


> FORMAT controls the output.  The only valid option for the second form specifies Coordinated Universal Time.  Interpreted sequences are:

`         %%     a literal %

> %a     locale's abbreviated weekday name (e.g., Sun)

> %A     locale's full weekday name (e.g., Sunday)

> %b     locale's abbreviated month name (e.g., Jan)

> %B     locale's full month name (e.g., January)

> %c     locale's date and time (e.g., Thu Mar  3 23:05:25 2005)

> %C     century; like %Y, except omit last two digits (e.g., 21)

> %d     day of month (e.g, 01)

> %D     date; same as %m/%d/%y

> %e     day of month, space padded; same as %_d_

> %F     full date; same as %Y-%m-%d

> %g     last two digits of year of ISO week number (see %G)

> %G     year of ISO week number (see %V); normally useful only with %V

> %h     same as %b

> %H     hour (00..23)

> %I     hour (01..12)

> %j     day of year (001..366)

> %k     hour ( 0..23)

> %l     hour ( 1..12)

> %m     month (01..12)

> %M     minute (00..59)

> %n     a newline

> %N     nanoseconds (000000000..999999999)

> %p     locale's equivalent of either AM or PM; blank if not known

> %P     like %p, but lower case

> %r     locale's 12-hour clock time (e.g., 11:11:04 PM)

> %R     24-hour hour and minute; same as %H:%M

> %s     seconds since 1970-01-01 00:00:00 UTC

> %S     second (00..60)

> %t     a tab

> %T     time; same as %H:%M:%S

> %u     day of week (1..7); 1 is Monday

> %U     week number of year, with Sunday as first day of week (00..53)

> %V     ISO week number, with Monday as first day of week (01..53)

> %w     day of week (0..6); 0 is Sunday

> %W     week number of year, with Monday as first day of week (00..53)

> %x     locale's date representation (e.g., 12/31/99)

> %X     locale's time representation (e.g., 23:13:48)

> %y     last two digits of year (00..99)

> %Y     year

> %z     +hhmm numeric timezone (e.g., -0400)

> %:z    +hh:mm numeric timezone (e.g., -04:00)

> %::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)

> %:::z  numeric time zone with : to necessary precision (e.g., -04, +05:30)

> %Z     alphabetic time zone abbreviation (e.g., EDT)

> By default, date pads numeric fields with zeroes.  The following optional flags may follow "%":

> -      (hyphen) do not pad the field

> _(underscore) pad with spaces_

> 0      (zero) pad with zeros

> ^      use upper case if possible

> `#`      use opposite case if possible

> After any flags comes an optional field width, as a decimal number; then an optional modifier, which
> is  either  E  to  use the locale's alternate representations if available, or O to use the locale's
> alternate numeric symbols if available.
`
### dd ###

> Copy a file, converting and formatting according to the operands.

> bs=BYTES
> > force ibs=BYTES and obs=BYTES


> cbs=BYTES
> > convert BYTES bytes at a time


> conv=CONVS
> > convert the file as per the comma separated symbol list


> count=BLOCKS
> > copy only BLOCKS input blocks


> ibs=BYTES
> > read BYTES bytes at a time


> if=FILE
> > read from FILE instead of stdin


> iflag=FLAGS
> > read as per the comma separated symbol list


> obs=BYTES
> > write BYTES bytes at a time


> of=FILE
> > write to FILE instead of stdout


> oflag=FLAGS
> > write as per the comma separated symbol list


> seek=BLOCKS
> > skip BLOCKS obs-sized blocks at start of output


> skip=BLOCKS
> > skip BLOCKS ibs-sized blocks at start of input


> status=noxfer
> > suppress transfer statistics


> BLOCKS and BYTES may be followed by the following multiplicative suffixes: xM M, c 1, w 2, b 512, kB
`           1000, K 1024, MB 1000\*1000, M 1024\*1024, GB 1000\*1000\*1000, G 1024\*1024\*1024, and so on for T, P, E,
> Z, Y.`

> Each CONV symbol may be:

> ascii  from EBCDIC to ASCII

> ebcdic from ASCII to EBCDIC

> ibm    from ASCII to alternate EBCDIC

> block  pad newline-terminated records with spaces to cbs-size

> unblock replace trailing spaces in cbs-size records with newline

> lcase  change upper case to lower case

> nocreat do not create the output file

> excl   fail if the output file already exists

> notrunc do not truncate the output file

> ucase  change lower case to upper case

> swab   swap every pair of input bytes

> noerror continue after read errors

> sync   pad every input block with NULs to ibs-size; when used with block or unblock, pad with spaces rather than NULs

> fdatasync physically write output file data before finishing

> fsync  likewise, but also write metadata

> Each FLAG symbol may be:

> append append mode (makes sense only for output; conv=notrunc suggested)

> direct use direct I/O for data

> directory fail unless a directory dsync     use synchronized I/O for data sync      likewise,
> but  also  for  metadata  nonblock   use non-blocking I/O noatime   do not update access time
> noctty    do not assign controlling terminal from file nofollow  do not follow symlinks

> Sending a USR1 signal to a running "dd" process makes it print I/O statistics to standard error  and
> then resume copying.

> $ dd if=/dev/zero of=/dev/null& pid=$!
> $ kill -USR1 $pid; sleep 1; kill $pid

> `18335302+0  records  in 18335302+0 records out 9387674624 bytes (9.4 GB) copied, 34.6279 seconds, 271 MB/s'

> Options are:

> --help display this help and exit

> --version output version information and exit


### df ###

This manual page documents the GNU version of df.  df displays the amount of disk space available on
> the file system containing each file name argument.  If no file name is given, the  space  available
> on all currently mounted file systems is shown.  Disk space is shown in 1K blocks by default, unless
> the environment variable POSIXLY\_CORRECT is set, in which case 512-byte blocks are used.

> If an argument is the absolute file name of a disk device node containing a mounted file system,  df
> shows  the  space available on that file system rather than on the file system containing the device
> node (which is always the root file system).  This version of df cannot show the space available  on
> unmounted file systems, because on most kinds of systems doing so requires very nonportable intimate
> knowledge of file system structures.

OPTIONS
> Show information about the file system on which each FILE resides, or all file systems by default.

> Mandatory arguments to long options are mandatory for short options too.

> -a, --all
> > include dummy file systems


> -B, --block-size=SIZE
> > use SIZE-byte blocks


> -h, --human-readable
> > print sizes in human readable format (e.g., 1K 234M 2G)


> -H, --si
> > likewise, but use powers of 1000 not 1024


> -i, --inodes
> > list inode information instead of block usage


> -k     like --block-size=1K

> -l, --local
> > limit listing to local file systems


> --no-sync
> > do not invoke sync before getting usage info (default)


> -P, --portability
> > use the POSIX output format


> --sync invoke sync before getting usage info

> -t, --type=TYPE
> > limit listing to file systems of type TYPE


> -T, --print-type
> > print file system type


> -x, --exclude-type=TYPE
> > limit listing to file systems not of type TYPE


> -v     (ignored)

> --help display this help and exit
`SIZE may be (or may be an integer optionally followed by) one of following:  kB  1000,  K  1024,  MB 1000*1000, M 1024*1024, and so on for G, T, P, E, Z, Y.`


### dir ###

List information about the FILEs (the current directory by default).  Sort entries alphabetically if
> none of -cftuvSUX nor --sort.

> Mandatory arguments to long options are mandatory for short options too.

> -a, --all
> > do not ignore entries starting with .


> -A, --almost-all
> > do not list implied . and ..


> --author
> > with -l, print the author of each file


> -b, --escape
> > print octal escapes for nongraphic characters


> --block-size=SIZE
> > use SIZE-byte blocks


> -B, --ignore-backups
> > do not list implied entries ending with ~


> -c     with -lt: sort by, and show, ctime (time of last modification  of  file  status  information)
> > with -l: show ctime and sort by name otherwise: sort by ctime


> -C     list entries by columns

> --color[=WHEN]
> > control  whether  color is used to distinguish file types.  WHEN may be never, always, or
> > auto


> -d, --directory
> > list directory entries instead of contents, and do not dereference symbolic links


> -D, --dired
> > generate output designed for Emacs' dired mode


> -f     do not sort, enable -aU, disable -ls --color

> -F, --classify
> > append indicator `(one of */=>@|)` to entries


> --file-type
> > likewise, except do not append `*`


> --format=WORD
> > across -x, commas -m, horizontal -x, long -l, single-column -1, verbose -l, vertical -C


> --full-time
> > like -l --time-style=full-iso


> -g     like -l, but do not list owner

> --group-directories-first
> > group directories before files


> -G, --no-group
> > in a long listing, don't print group names


> -h, --human-readable
> > with -l, print sizes in human readable format (e.g., 1K 234M 2G)


> --si   likewise, but use powers of 1000 not 1024

> -H, --dereference-command-line
> > follow symbolic links listed on the command line


> --dereference-command-line-symlink-to-dir
> > follow each command line symbolic link that points to a directory


> --hide=PATTERN
> > do not list implied entries matching shell PATTERN (overridden by -a or -A)


> --indicator-style=WORD
> > append indicator with style WORD to  entry  names:  none  (default),  slash  (-p),  file-type
> > (--file-type), classify (-F)


> -i, --inode
> > print the index number of each file


> -I, --ignore=PATTERN
> > do not list implied entries matching shell PATTERN


> -k     like --block-size=1K

> -l     use a long listing format

> -L, --dereference
> > when  showing  file  information  for a symbolic link, show information for the file the link
> > references rather than for the link itself


> -m     fill width with a comma separated list of entries

> -n, --numeric-uid-gid
> > like -l, but list numeric user and group IDs


> -N, --literal
> > print raw entry names (don't treat e.g. control characters specially)


> -o     like -l, but do not list group information

> -p, --indicator-style=slash
> > append / indicator to directories


> -q, --hide-control-chars
> > print ? instead of non graphic characters


> --show-control-chars
> > show non graphic characters as-is (default unless program is 'ls' and output is a terminal)


> -Q, --quote-name
> > enclose entry names in double quotes


> --quoting-style=WORD
> > use quoting style WORD for entry names: literal, locale, shell, shell-always, c, escape


> -r, --reverse
> > reverse order while sorting


> -R, --recursive
> > list subdirectories recursively


> -s, --size
> > print the size of each file, in blocks


> -S     sort by file size

> --sort=WORD
> > sort by WORD instead of name: none -U, extension -X, size -S, time -t, version -v


> --time=WORD
> > with -l, show time as WORD instead of modification time: atime -u, access -u, use  -u,  ctime
> > -c, or status -c; use specified time as sort key if --sort=time


> --time-style=STYLE
> > with  -l,  show times using style STYLE: full-iso, long-iso, iso, locale, +FORMAT.  FORMAT is
> > interpreted like date; if FORMAT is `FORMAT1<newline>FORMAT2,` FORMAT1 applies to  non-recent
> > files  and  FORMAT2  to  recent files; if STYLE is prefixed with posix-, STYLE takes effect
> > only outside the POSIX locale


> -t     sort by modification time

> -T, --tabsize=COLS
> > assume tab stops at each COLS instead of 8


> -u     with -lt: sort by, and show, access time with -l: show access time and sort  by  name  otherwise: sort by access time

> -U     do not sort; list entries in directory order

> -v     sort by version

> -w, --width=COLS
> > assume screen width instead of current value


> -x     list entries by lines instead of by columns

> -X     sort alphabetically by entry extension

> -Z, --context
> > print any SELinux security context of each file


> -1     list one file per line

> --help display this help and exit

> --version
> > output version information and exit


> SIZE  may  be  (or  may  be an integer optionally followed by) one of following: kB 1000, K 1024, MB 1000\*1000, M 1024\*1024, and so on for G, T, P, E, Z, Y.

> By default, color is not  used  to  distinguish  types  of  files.   That  is  equivalent  to  using
> --color=none.   Using  the  --color option without the optional WHEN argument is equivalent to using
> --color=always.  With --color=auto, color codes are output only if standard output is connected to a
> terminal  (tty).  The environment variable LS\_COLORS can influence the colors, and can be set easily
> by the dircolors command.

> Exit status is 0 if OK, 1 if minor problems, 2 if serious trouble.


### dircolors ###
> Output commands to set the LS\_COLORS environment variable.

> Determine format of output:
> > -b, --sh, --bourne-shell
> > > output Bourne shell code to set LS\_COLORS


> -c, --csh, --c-shell
> > output C shell code to set LS\_COLORS


> -p, --print-database
> > output defaults


> --help display this help and exit

> --version
> > output version information and exit


> If  FILE is specified, read it to determine which colors to use for which file types and extensions.
> Otherwise, a precompiled database is used.  For details on the format of these files, run dircolors
> --print-database.

### dirname ###

> Print  NAME  with  its trailing /component removed; if NAME contains no /'s, output '.' (meaning the
> current directory).

> --help display this help and exit

> --version
> > output version information and exit

EXAMPLES

> dirname /usr/bin/sort
> > Output "/usr/bin".


> dirname stdio.h
> > Output ".".

### du ###

Summarize disk usage of each FILE, recursively for directories.


> Mandatory arguments to long options are mandatory for short options too.

> -a, --all
> > write counts for all files, not just directories


> --apparent-size
> > print  apparent sizes, rather than disk usage; although the apparent size is usually smaller,
> > it may be larger due to holes in (sparse) files, internal fragmentation,  indirect  blocks,
> > and the like


> -B, --block-size=SIZE
> > use SIZE-byte blocks


> -b, --bytes
> > equivalent to "--apparent-size --block-size=1"


> -c, --total
> > produce a grand total


> -D, --dereference-args
> > dereference only symlinks that are listed on the command line


> --files0-from=F
> > summarize disk usage of the NUL-terminated file names specified in file F


> -H     like --si, but also evokes a warning; will soon change to be equivalent to --dereference-args
> > (-D)


> -h, --human-readable
> > print sizes in human readable format (e.g., 1K 234M 2G)


> --si   like -h, but use powers of 1000 not 1024

> -k     like --block-size=1K

> -l, --count-links
> > count sizes many times if hard linked


> -m     like --block-size=1M

> -L, --dereference
> > dereference all symbolic links


> -P, --no-dereference
> > don't follow any symbolic links (this is the default)


> -0, --null
> > end each output line with 0 byte rather than newline


> -S, --separate-dirs
> > do not include size of subdirectories


> -s, --summarize
> > display only a total for each argument


> -x, --one-file-system
> > skip directories on different file systems


> -X FILE, --exclude-from=FILE
> > Exclude files that match any pattern in FILE.


> --exclude=PATTERN
> > Exclude files that match PATTERN.


> --max-depth=N
> > print the total for a directory (or file, with --all) only if it is N or fewer  levels  below
> > the command line argument;  --max-depth=0 is the same as --summarize


> --time show time of the last modification of any file in the directory, or any of its subdirectories

> --time=WORD
> > show time as WORD instead of modification time: atime, access, use, ctime or status


> --time-style=STYLE
> > show times using style STYLE: full-iso, long-iso, iso, +FORMAT  FORMAT  is  interpreted  like
> > 'date'


> --help display this help and exit

> --version
> > output version information and exit


> SIZE  may  be  (or  may  be an integer optionally followed by) one of following: kB 1000, K 1024, MB `1000*1000, M 1024*1024,` and so on for G, T, P, E, Z, Y.

PATTERNS
> PATTERN is a shell pattern (not a regular expression).  The pattern ?  matches  any  one  character,
> whereas  `*` matches any string (composed of zero, one or multiple characters).  For example, `*.o` will
> match any files whose names end in .o.  Therefore, the command

> du --exclude=`*.o`

> will skip all files and subdirectories ending in .o (including the file .o itself).

### echo ###

Echo the STRING(s) to standard output.

> -n     do not output the trailing newline

> -e     enable interpretation of backslash escapes

> -E     disable interpretation of backslash escapes (default)

> --help display this help and exit

> --version
> > output version information and exit


> If -e is in effect, the following sequences are recognized:

> \0NNN  the character whose ASCII code is NNN (octal)

> \\     backslash

> \a     alert (BEL)

> \b     backspace

> \c     suppress trailing newline

> \f     form feed

> \n     new line

> \r     carriage return

> \t     horizontal tab

> \v     vertical tab

> NOTE:  your  shell  may have its own version of echo, which usually supersedes the version described
> here.  Please refer to your shell's documentation for details about the options it supports.

### env ###

> Set each NAME to VALUE in the environment and run COMMAND.

> -i, --ignore-environment
> > start with an empty environment


> -u, --unset=NAME
> > remove variable from the environment


> --help display this help and exit

> --version
> > output version information and exit


> A mere - implies -i.  If no COMMAND, print the resulting environment.


### expand ###

> Convert  tabs  in each FILE to spaces, writing to standard output.  With no FILE, or when FILE is -,
> > read standard input.


> Mandatory arguments to long options are mandatory for short options too.

> -i, --initial
> > do not convert tabs after non blanks


> -t, --tabs=NUMBER
> > have tabs NUMBER characters apart, not 8


> -t, --tabs=LIST
> > use comma separated list of explicit tab positions


> --help display this help and exit

> --version
> > output version information and exit

### expr ###


> --help display this help and exit

> --version
> > output version information and exit


> Print  the  value  of EXPRESSION to standard output.  A blank line below separates increasing preceâ
> dence groups.  EXPRESSION may be:

> ARG1 | ARG2
> > ARG1 if it is neither null nor 0, otherwise ARG2


> ARG1 & ARG2
> > ARG1 if neither argument is null or 0, otherwise 0


> ARG1 < ARG2
> > ARG1 is less than ARG2


> ARG1 <= ARG2
> > ARG1 is less than or equal to ARG2


> ARG1 = ARG2
> > ARG1 is equal to ARG2


> ARG1 != ARG2
> > ARG1 is unequal to ARG2


> ARG1 >= ARG2
> > ARG1 is greater than or equal to ARG2


> ARG1 > ARG2
> > ARG1 is greater than ARG2


> ARG1 + ARG2
> > arithmetic sum of ARG1 and ARG2


> ARG1 - ARG2
> > arithmetic difference of ARG1 and ARG2


> ARG1 `*` ARG2
> > arithmetic product of ARG1 and ARG2


> ARG1 / ARG2
> > arithmetic quotient of ARG1 divided by ARG2


> ARG1 % ARG2
> > arithmetic remainder of ARG1 divided by ARG2


> STRING : REGEXP
> > anchored pattern match of REGEXP in STRING


> match STRING REGEXP
> > same as STRING : REGEXP


> substr STRING POS LENGTH
> > substring of STRING, POS counted from 1


> index STRING CHARS
> > index in STRING where any CHARS is found, or 0


> length STRING
> > length of STRING


> + TOKEN
> > interpret TOKEN as a string, even if it is a


> keyword like âmatchâ or an operator like "/"

> ( EXPRESSION )
> > value of EXPRESSION


> Beware that many operators need to be escaped or quoted for shells.  Comparisons are  arithmetic  if
> both  ARGs  are numbers, else lexicographical.  Pattern matches return the string matched between \(
> and \) or null; if \( and \) are not used, they return the number of characters matched or 0.

> Exit status is 0 if EXPRESSION is neither null nor 0, 1 if EXPRESSION is null or 0, 2 if  EXPRESSION
> is syntactically invalid, and 3 if an error occurred.

### factor ###

> Print the prime factors of each NUMBER.

> --help display this help and exit

> --version
> > output version information and exit


> Print the prime factors of all specified integer NUMBERs.  If no arguments are specified on the command line, they are read from standard input.

### false ###

> Exit with a status code indicating failure.

> --help display this help and exit

> --version
> > output version information and exit


> NOTE:  your  shell may have its own version of false, which usually supersedes the version described
> here.  Please refer to your shell's documentation for details about the options it supports.

### fmt ###

> Reformat  each  paragraph in the FILE(s), writing to standard output.  If no FILE or if FILE is -,
> read standard input.

> Mandatory arguments to long options are mandatory for short options too.

> -c, --crown-margin
> > preserve indentation of first two lines


> -p, --prefix=STRING
> > reformat only lines beginning with STRING, reattaching the prefix to reformatted lines


> -s, --split-only
> > split long lines, but do not refill


> -t, --tagged-paragraph
> > indentation of first line different from second


> -u, --uniform-spacing
> > one space between words, two after sentences


> -w, --width=WIDTH
> > maximum line width (default of 75 columns)


> --help display this help and exit

> --version
> > output version information and exit


> With no FILE, or when FILE is -, read standard input.

### fold ###

> Wrap input lines in each FILE (standard input by default), writing to standard output.

> Mandatory arguments to long options are mandatory for short options too.

> -b, --bytes
> > count bytes rather than columns


> -s, --spaces
> > break at spaces


> -w, --width=WIDTH
> > use WIDTH columns instead of 80


> --help display this help and exit

> --version
> > output version information and exit

### groups ###

> print the groups a user is in

> --help display this help and exit

> --version
> > output version information and exit


> Same as id -Gn.  If no USERNAME, use current process.

### head ###

> Print  the  first  10  lines of each FILE to standard output.  With more than one FILE, precede each
> > with a header giving the file name.  With no FILE, or when FILE is -, read standard input.


> Mandatory arguments to long options are mandatory for short options too.

> -c, --bytes=[-]N
> > print the first N bytes of each file; with the leading â-â, print all but the last N bytes of
> > each file


> -n, --lines=[-]N
> > print the first N lines instead of the first 10; with the leading â-â, print all but the last
> > N lines of each file


> -q, --quiet, --silent
> > never print headers giving file names


> -v, --verbose
> > always print headers giving file names


> --help display this help and exit

> --version
> > output version information and exit


> N may  have  a  multiplier  suffix:  b  512,  kB  1000,  K  1024,  MB  `1000*1000,  M  1024*1024,  GB       1000*1000*1000, G 1024*1024*1024,` and so on for T, P, E, Z, Y.

### hostid ###

> Print the numeric identifier (in hexadecimal) for the current host.

> --help display this help and exit

> --version
> > output version information and exit


### id ###


> Print information for USERNAME, or the current user.

> -a     ignore, for compatibility with other versions

> -Z, --context
> > print only the security context of the current user


> -g, --group
> > print only the effective group ID


> -G, --groups
> > print all group IDs


> -n, --name
> > print a name instead of a number, for -ugG


> -r, --real
> > print the real ID instead of the effective ID, with -ugG


> -u, --user
> > print only the effective user ID


> --help display this help and exit

> --version
> > output version information and exit


> Without any OPTION, print some useful set of identified information.

### install ###

> In the first three forms, copy SOURCE to DEST or multiple SOURCE(s) to the existing DIRECTORY, while
> > setting permission modes and owner/group.  In the 4th form,  create  all  components  of  the  given
> > DIRECTORY(ies).


> Mandatory arguments to long options are mandatory for short options too.

> --backup[=CONTROL]
> > make a backup of each existing destination file


> -b     like --backup but does not accept an argument

> -c     (ignored)

> -d, --directory
> > treat all arguments as directory names; create all components of the specified directories


> -D     create all leading components of DEST except the last, then copy SOURCE to DEST

> -g, --group=GROUP
> > set group ownership, instead of processâ current group


> -m, --mode=MODE
> > set permission mode (as in chmod), instead of rwxr-xr-x


> -o, --owner=OWNER
> > set ownership (super-user only)


> -p, --preserve-timestamps
> > apply access/modification times of SOURCE files to corresponding destination files


> -s, --strip
> > strip symbol tables


> -S, --suffix=SUFFIX
> > override the usual backup suffix


> -t, --target-directory=DIRECTORY
> > copy all SOURCE arguments into DIRECTORY


> -T, --no-target-directory
> > treat DEST as a normal file


> -v, --verbose
> > print the name of each directory as it is created


> --preserve-context
> > preserve SELinux security context


> -Z, --context=CONTEXT
> > set SELinux security context of files and directories


> --help display this help and exit

> --version
> > output version information and exit


> The  backup  suffix  is  "~", unless set with --suffix or SIMPLE\_BACKUP\_SUFFIX.  The version control
> method may be selected via the --backup option or through the VERSION\_CONTROL environment  variable.
> Here are the values:

> none, off
> > never make backups (even if --backup is given)


> numbered, t
> > make numbered backups


> existing, nil
> > numbered if numbered backups exist, simple otherwise


> simple, never
> > always make simple backups

### join ###


> For  each  pair  of  input  lines  with identical join fields, write a line to standard output.  The
> > default join field is the first, delimited by whitespace.  When FILE1 or FILE2 (not both) is -, read
> > standard input.


> -a FILENUM
> > print  unpairable  lines  coming from file FILENUM, where FILENUM is 1 or 2, corresponding to
> > FILE1 or FILE2


> -e EMPTY
> > replace missing input fields with EMPTY


> -i, --ignore-case
> > ignore differences in case when comparing fields


> -j FIELD
> > equivalent to -1 FIELD -2 FIELD


> -o FORMAT
> > obey FORMAT while constructing output line


> -t CHAR
> > use CHAR as input and output field separator


> -v FILENUM
> > like -a FILENUM, but suppress joined output lines


> -1 FIELD
> > join on this FIELD of file 1


> -2 FIELD
> > join on this FIELD of file 2


> --help display this help and exit

> --version
> > output version information and exit


> Unless -t CHAR is given, leading blanks separate fields and are ignored, else fields  are  separated
> by  CHAR.   Any  FIELD is a field number counted from 1.  FORMAT is one or more comma or blank separated specifications, each being "FILENUM.FIELD" or 0.  Default FORMAT outputs the join field, the
> remaining fields from FILE1, the remaining fields from FILE2, all separated by CHAR.

> Important:  FILE1  and  FILE2 must be sorted on the join fields.  E.g., use sort -k 1b,1 if join
> has no options.

### link ###

> Call the link function to create a link named FILE2 to an existing FILE1.

> --help display this help and exit

> --version
> > output version information and exit

### ln ###


> In the 1st form, create a link to TARGET with the name LINK\_NAME.  In the 2nd form, create a link to
> > TARGET in the current directory.  In the 3rd and 4th forms, create links to each  TARGET  in  DIRECTORY.  Create hard links by default, symbolic links with --symbolic.  When creating hard links, each
> > TARGET must exist.


> Mandatory arguments to long options are mandatory for short options too.

> --backup[=CONTROL]
> > make a backup of each existing destination file


> -b     like --backup but does not accept an argument

> -d, -F, --directory
> > allow the superuser to attempt to hard link directories (note: will probably fail due to system restrictions, even for the superuser)


> -f, --force
> > remove existing destination files


> -n, --no-dereference
> > treat destination that is a symlink to a directory as if it were a normal file


> -i, --interactive
> > prompt whether to remove destinations


> -s, --symbolic
> > make symbolic links instead of hard links


> -S, --suffix=SUFFIX
> > override the usual backup suffix


> -t, --target-directory=DIRECTORY
> > specify the DIRECTORY in which to create the links


> -T, --no-target-directory
> > treat LINK\_NAME as a normal file


> -v, --verbose
> > print name of each linked file


> --help display this help and exit

> --version
> > output version information and exit


> The  backup  suffix  is  ~, unless set with --suffix or SIMPLE\_BACKUP\_SUFFIX.  The version control
> method may be selected via the --backup option or through the VERSION\_CONTROL environment  variable.
> Here are the values:

> none, off
> > never make backups (even if --backup is given)


> numbered, t
> > make numbered backups


> existing, nil
> > numbered if numbered backups exist, simple otherwise


> simple, never
> > always make simple backups

### logname ###


> Print the name of the current user.

> --help display this help and exit

> --version
> > output version information and exit

### ls ###

Ref dir

### md5sum ###


> Print or check MD5 (128-bit) checksums.  With no FILE, or when FILE is -, read standard input.

> -b, --binary
> > read in binary mode


> -c, --check
> > read MD5 sums from the FILEs and check them


> -t, --text
> > read in text mode (default)


> The following two options are useful only when verifying checksums:
> > --status
> > > donât output anything, status code shows success


> -w, --warn
> > warn about improperly formatted checksum lines


> --help display this help and exit

> --version
> > output version information and exit

> The  sums are computed as described in RFC 1321.  When checking, the input should be a former output
> of this program.  The default mode is to print a line with checksum,  a  character  indicating  type
> (`*` for binary, " " for text), and name for each FILE.

### mkdir ###

> Create the DIRECTORY(ies), if they do not already exist.

> Mandatory arguments to long options are mandatory for short options too.

> -m, --mode=MODE
> > set file mode (as in chmod), not a=rwx - umask


> -p, --parents
> > no error if existing, make parent directories as needed


> -v, --verbose
> > print a message for each created directory


> -Z, --context=CTX
> > set the SELinux security context of each created directory to CTX


> --help display this help and exit

> --version
> > output version information and exit

### mkfifo ###


> Create named pipes (FIFOs) with the given NAMEs.

> -Z, --context=CTX
> > set the SELinux security context of each NAME to CTX


> Mandatory arguments to long options are mandatory for short options too.

> -m, --mode=MODE
> > set file permission bits to MODE, not a=rw - umask


> --help display this help and exit

> --version
> > output version information and exit


### mknod ###


> Create the special file NAME of the given TYPE.

> -Z, --context=CTX
> > set the SELinux security context of NAME to CTX


> Mandatory arguments to long options are mandatory for short options too.

> -m, --mode=MODE
> > set file permission bits to MODE, not a=rw - umask


> --help display this help and exit

> --version
> > output version information and exit


> Both  MAJOR  and MINOR must be specified when TYPE is b, c, or u, and they must be omitted when TYPE
> is p.  If MAJOR or MINOR begins with 0x or 0X, it is interpreted as hexadecimal;  otherwise,  if  it
> begins with 0, as octal; otherwise, as decimal.  TYPE may be:

> b      create a block (buffered) special file

> c, u   create a character (unbuffered) special file

> p      create a FIFO

### mv ###
> Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.

> Mandatory arguments to long options are mandatory for short options too.

> --backup[=CONTROL]
> > make a backup of each existing destination file


> -b     like --backup but does not accept an argument

> -f, --force
> > do not prompt before overwriting


> -i, --interactive
> > prompt before overwrite


> --strip-trailing-slashes
> > remove any trailing slashes from each SOURCE argument


> -S, --suffix=SUFFIX
> > override the usual backup suffix


> -t, --target-directory=DIRECTORY
> -T, --no-target-directory
> > treat DEST as a normal file


> -u, --update
> > move  only  when  the  SOURCE file is newer than the destination file or when the destination
> > file is missing


> -v, --verbose
> > explain what is being done


> --help display this help and exit

> --version
> > output version information and exit


> The backup suffix is ~, unless set with --suffix or  SIMPLE\_BACKUP\_SUFFIX.   The  version  control
> method  may be selected via the --backup option or through the VERSION\_CONTROL environment variable.
> Here are the values:

> none, off
> > never make backups (even if --backup is given)


> numbered, t
> > make numbered backups


> existing, nil
> > numbered if numbered backups exist, simple otherwise


> simple, never
> > always make simple backups


### nice ###


> Run COMMAND with an adjusted niceness, which affects process scheduling.  With no COMMAND, print the
> current niceness.  Nicenesses range from -20 (most favorable scheduling) to 19 (least favorable).

> -n, --adjustment=N
> > add integer N to the niceness (default 10)


> --help display this help and exit

> --version
> > output version information and exit


> NOTE: your shell may have its own version of nice, which usually supersedes  the  version  described
> here.  Please refer to your shell's documentation for details about the options it supports.

### nl ###

> Write  each FILE to standard output, with line numbers added.  With no FILE, or when FILE is -, read
> standard input.

> Mandatory arguments to long options are mandatory for short options too.

> -b, --body-numbering=STYLE
> > use STYLE for numbering body lines


> -d, --section-delimiter=CC
> > use CC for separating logical pages


> -f, --footer-numbering=STYLE
> > use STYLE for numbering footer lines


> -h, --header-numbering=STYLE
> > use STYLE for numbering header lines


> -i, --page-increment=NUMBER
> > line number increment at each line


> -l, --join-blank-lines=NUMBER
> > group of NUMBER empty lines counted as one


> -n, --number-format=FORMAT
> > insert line numbers according to FORMAT


> -p, --no-renumber
> > do not reset line numbers at logical pages


> -s, --number-separator=STRING
> > add STRING after (possible) line number


> -v, --first-page=NUMBER
> > first line number on each logical page


> -w, --number-width=NUMBER
> > use NUMBER columns for line numbers


> --help display this help and exit

> --version
> > output version information and exit


> By default, selects -v1 -i1 -l1 -sTAB -w6 -nrn -hn -bt -fn.  CC are  two  delimiter  characters  for
> separating logical pages, a missing second character implies :.  Type \\ for \.  STYLE is one of:

> a      number all lines

> t      number only nonempty lines

> n      number no lines

> pBRE   number only lines that contain a match for the basic regular expression, BRE

> FORMAT is one of:

> ln     left justified, no leading zeros

> rn     right justified, no leading zeros

> rz     right justified, leading zeros


### nohup ###

> Run COMMAND, ignoring hangup signals.

> --help display this help and exit

> --version
> > output version information and exit


> If  standard  input  is  a  terminal, redirect it from /dev/null.  If standard output is a terminal,
> append output to "nohup.out" if possible, "$HOME/nohup.out" otherwise.  If standard error is a  terminal, redirect it to standard output.  To save output to FILE, use "nohup COMMAND > FILE".

> NOTE:  your  shell may have its own version of nohup, which usually supersedes the version described
> here.  Please refer to your shell's documentation for details about the options it supports.

### od ###

> Write  an unambiguous representation, octal bytes by default, of FILE to standard output.  With more
> than one FILE argument, concatenate them in the listed order to form the input.  With  no  FILE,  or
> when FILE is -, read standard input.

> All arguments to long options are mandatory for short options.

> -A, --address-radix=RADIX
> > decide how file offsets are printed


> -j, --skip-bytes=BYTES
> > skip BYTES input bytes first


> -N, --read-bytes=BYTES
> > limit dump to BYTES input bytes


> -S, --strings[=BYTES]
> > output strings of at least BYTES graphic chars


> -t, --format=TYPE
> > select output format or formats


> -v, --output-duplicates
> > do not use `*` to mark line suppression


> -w, --width[=BYTES]
> > output BYTES bytes per output line


> --traditional
> > accept arguments in traditional form


> --help display this help and exit

> --version
> > output version information and exit


> Traditional format specifications may be intermixed; they accumulate:
> > -a     same as -t a,  select named characters, ignoring high-order bit


> -b     same as -t o1, select octal bytes

> -c     same as -t c,  select ASCII characters or backslash escapes

> -d     same as -t u2, select unsigned decimal 2-byte units

> -f     same as -t fF, select floats

> -i     same as -t dI, select decimal ints

> -l     same as -t dL, select decimal longs

> -o     same as -t o2, select octal 2-byte units

> -s     same as -t d2, select decimal 2-byte units

> -x     same as -t x2, select hexadecimal 2-byte units

> If first and second call formats both apply, the second format is assumed if the last operand begins
> with + or (if there are 2 operands) a digit.  An OFFSET operand  means  -j  OFFSET.   LABEL  is  the
> pseudo-address at first byte printed, incremented when dump is progressing.  For OFFSET and LABEL, a
> 0x or 0X prefix indicates hexadecimal; suffixes may be . for octal and b for multiply by 512.

> TYPE is made up of one or more of these specifications:

> a      named character, ignoring high-order bit

> c      ASCII character or backslash escape

> d[SIZE](SIZE.md)
> > signed decimal, SIZE bytes per integer


> f[SIZE](SIZE.md)
> > floating point, SIZE bytes per integer


> o[SIZE](SIZE.md)
> > octal, SIZE bytes per integer


> u[SIZE](SIZE.md)
> > unsigned decimal, SIZE bytes per integer


> x[SIZE](SIZE.md)
> > hexadecimal, SIZE bytes per integer


> SIZE is a number.  For TYPE in doux, SIZE may also be C for sizeof(char), S for sizeof(short), I for
> sizeof(int)  or  L  for  sizeof(long).   If  TYPE  is f, SIZE may also be F for sizeof(float), D for
> sizeof(double) or L for sizeof(long double).

> RADIX is d for decimal, o for octal, x for hexadecimal or n for none.  BYTES is hexadecimal with  0x
> or  0X  prefix, and may have a multiplier suffix: b 512, kB 1000, K 1024, `MB 1000*1000, M 1024*1024,`
> `GB 1000*1000*1000, G 1024*1024*1024`, and so on for T, P, E, Z, Y.  Adding a z  suffix  to  any  type
> displays  printable characters at the end of each output line.  --string without a number implies 3.
> --width without a number implies 32.  By default, od uses -A o -t d2 -w16.

### paste ###

> Write lines consisting of the sequentially corresponding lines from each FILE, separated by TABs, to
> standard output.  With no FILE, or when FILE is -, read standard input.

> Mandatory arguments to long options are mandatory for short options too.

> -d, --delimiters=LIST
> > reuse characters from LIST instead of TABs


> -s, --serial
> > paste one file at a time instead of in parallel


> --help display this help and exit

> --version
> > output version information and exit

### pathchk ###


> Diagnose unportable constructs in NAME.

> -p     check for most POSIX systems

> -P     check for empty names and leading "-"

> --portability
> > check for all POSIX systems (equivalent to -p -P)


> --help display this help and exit

> --version
> > output version information and exit


### pinky ###


> -l     produce long format output for the specified USERs

> -b     omit the user's home directory and shell in long format

> -h     omit the user's project file in long format

> -p     omit the user's plan file in long format

> -s     do short format output, this is the default

> -f     omit the line of column headings in short format

> -w     omit the user's full name in short format

> -i     omit the user's full name and remote host in short format

> -q     omit the user's full name, remote host and idle time in short format

> --help display this help and exit

> --version
> > output version information and exit


> A lightweight "finger" program;  print user information.  The utmp file will be /var/run/utmp.

### pr ###

> Paginate or columnate FILE(s) for printing.

> Mandatory arguments to long options are mandatory for short options too.

> +FIRST\_PAGE[:`LAST_PAGE]`, --pages=FIRST\_PAGE`[:LAST_PAGE]`
> > begin `[stop]` printing with page FIRST`_[LAST_]PAGE`


> -COLUMN, --columns=COLUMN
> > output  COLUMN  columns and print columns down, unless -a is used. Balance number of lines in
> > the columns on each page.


> -a, --across
> > print columns across rather than down, used together with -COLUMN


> -c, --show-control-chars
> > use hat notation (^G) and octal backslash notation


> -d, --double-space
> > double space the output


> -D, --date-format=FORMAT
> > use FORMAT for the header date


> -e`[CHAR[WIDTH]], --expand-tabs[=CHAR[WIDTH]]`
> > expand input CHARs (TABs) to tab WIDTH (8)


> -F, -f, --form-feed
> > use form feeds instead of newlines to separate pages (by a 3-line page header with  -F  or  a
> > 5-line header and trailer without -F)


> -h HEADER, --header=HEADER
> > use  a  centered  HEADER instead of filename in page header, -h "" prints a blank line, don't
> > use -h""


> -i`[CHAR[WIDTH]], --output-tabs[=CHAR[WIDTH]]`
> > replace spaces with CHARs (TABs) to tab WIDTH (8)


> -J, --join-lines
> > merge full lines, turns off -W line truncation, no  column  alignment,  --sep-string[=STRING]
> > sets separators


> -l PAGE\_LENGTH, --length=PAGE\_LENGTH
> > set  the  page length to PAGE\_LENGTH (66) lines (default number of lines of text 56, and with
> > -F 63)


> -m, --merge
> > print all files in parallel, one in each column, truncate  lines,  but  join  lines  of  full
> > length with -J


> -n`[SEP[DIGITS]], --number-lines[=SEP[DIGITS]]`
> > number lines, use DIGITS (5) digits, then SEP (TAB), default counting starts with 1st line of
> > input file


> -N NUMBER, --first-line-number=NUMBER
> > start counting with NUMBER at 1st line of first page printed (see +FIRST\_PAGE)

> -o MARGIN, --indent=MARGIN
> > offset each line with MARGIN (zero) spaces, do not affect -w or -W, MARGIN will be  added  to
> > PAGE\_WIDTH


> -r, --no-file-warnings
> > omit warning when a file cannot be opened


> -s`[CHAR],--separator[=CHAR]`
> > separate  columns  by  a single character, default for CHAR is the 

&lt;TAB&gt;

 character without -w
> > and "no char" with -w -s[CHAR](CHAR.md) turns off line truncation of all 3 column options  (-COLUMN|-a
> > -COLUMN|-m) except -w is set


> -SSTRING, --sep-string`[=STRING]`
> > separate columns by STRING, without -S: Default separator `<TAB>` with -J and `<space>` otherwise
> > (same as -S" "), no effect on column options


> -t, --omit-header
> > omit page headers and trailers


> -T, --omit-pagination
> > omit page headers and trailers, eliminate any pagination by form feeds set in input files


> -v, --show-nonprinting
> > use octal backslash notation


> -w `PAGE_WIDTH, --width=PAGE_WIDTH`
> > set page width to `PAGE_WIDTH` (72) characters for multiple text-column output  only,  -s`[char]`
> > turns off (72)


> -W `PAGE_WIDTH, --page-width=PAGE_WIDTH`
> > set page width to PAGE\_WIDTH (72) characters always, truncate lines, except -J option is set,
> > no interference with -S or -s


> --help display this help and exit

> --version
> > output version information and exit


> -t is implied if `PAGE\_LENGTH <= 10.  With no FILE, or when FILE is -, read standard input.

### printenv ###

> print all or part of environment
> If no environment VARIABLE specified, print them all.

> --help display this help and exit

> --version
> > output version information and exit


> NOTE:  your  shell  may  have  its  own  version  of  printenv, which usually supersedes the version
> described here.  Please refer to your shell's documentation for details about the  options  it  supports.

### printf ###

> Print ARGUMENT(s) according to FORMAT, or execute according to OPTION:

> --help display this help and exit

> --version
> > output version information and exit


> FORMAT controls the output as in C printf.  Interpreted sequences are:

> \"     double quote

> \NNN   character with octal value NNN (1 to 3 digits)

> \\     backslash

> \a     alert (BEL)

> \b     backspace

> \c     produce no further output

> \f     form feed

> \n     new line

> \r     carriage return

> \t     horizontal tab

> \v     vertical tab

> \xHH   byte with hexadecimal value HH (1 to 2 digits)

> \uHHHH Unicode (ISO/IEC 10646) character with hex value HHHH (4 digits)

> \UHHHHHHHH
> > Unicode character with hex value HHHHHHHH (8 digits)


> %%     a single %

> %b     ARGUMENT  as a string with \ escapes interpreted, except that octal escapes are of the form
> > \0 or \0NNN


> and all C format specifications ending with one of diouxXfeEgGcs, with ARGUMENTs converted to proper
> type first.  Variable widths are handled.

> NOTE:  your shell may have its own version of printf, which usually supersedes the version described
> here.  Please refer to your shell's documentation for details about the options it supports.


### ptx ###

> Output a permuted index, including context, of the words in the input files.

> Mandatory arguments to long options are mandatory for short options too.

> -A, --auto-reference
> > output automatically generated references


> -G, --traditional
> > behave more like System V âptxâ


> -F, --flag-truncation=STRING
> > use STRING for flagging line truncations


> -M, --macro-name=STRING
> > macro name to use instead of âxxâ


> -O, --format=roff
> > generate output as roff directives


> -R, --right-side-refs
> > put references at right, not counted in -w


> -S, --sentence-regexp=REGEXP

> -T, --format=tex
> > generate output as TeX directives


> -W, --word-regexp=REGEXP
> > use REGEXP to match each keyword


> -b, --break-file=FILE
> > word break characters in this FILE


> -f, --ignore-case
> > fold lower case to upper case for sorting


> -g, --gap-size=NUMBER
> > gap size in columns between output fields


> -i, --ignore-file=FILE
> > read ignore word list from FILE


> -o, --only-file=FILE
> > read only word list from this FILE


> -r, --references
> > first field of each line is a reference


> -t, --typeset-mode               - not implemented -

> -w, --width=NUMBER
> > output width in columns, reference excluded


> --help display this help and exit

> --version
> > output version information and exit


> With no FILE or if FILE is -, read Standard Input.  -F / by default.

### pwd ###

> Print the full filename of the current working directory.

> --help display this help and exit

> --version
> > output version information and exit


> NOTE:  your  shell  may  have its own version of pwd, which usually supersedes the version described
> here.  Please refer to your shell's documentation for details about the options it supports.

### readlink ###

> Display value of a symbolic link on standard output.

> -f, --canonicalize
> > canonicalize by following every symlink in every component of the given name recursively; all
> > but the last component must exist


> -e, --canonicalize-existing
> > canonicalize by following every symlink in every component of the given name recursively, all
> > components must exist


> -m, --canonicalize-missing
> > canonicalize  by  following  every  symlink in every component of the given name recursively,
> > without requirements on components existence


> -n, --no-newline
> > do not output the trailing newline


> -q, --quiet,

> -s, --silent
> > suppress most error messages


> -v, --verbose
> > report error messages


> --help display this help and exit

> --version
> > output version information and exit


### rm ###


> Remove (unlink) the FILE(s).

> -f, --force
> > ignore nonexistent files, never prompt


> -i     prompt before every removal

> -I     prompt once before removing more than three files, or when removing recursively.  Less intrusive than -i, while still giving protection against most mistakes

> --interactive[=WHEN]
> > prompt according to WHEN: never, once (-I), or always (-i).  Without WHEN, prompt always


> --one-file-system
> > when  removing a hierarchy recursively, skip any directory that is on a file system different
> > from that of the corresponding command line argument


> --no-preserve-root
> > do not treat / specially


> --preserve-root
> > do not remove / (default)


> -r, -R, --recursive
> > remove directories and their contents recursively


> -v, --verbose
> > explain what is being done


> --help display this help and exit

> --version
> > output version information and exit


> By default, rm does not remove directories.  Use the --recursive (-r or -R) option  to  remove  each
> listed directory, too, along with all of its contents.

> To remove a file whose name starts with a -, for example -foo, use one of these commands:

> rm -- -foo

> rm ./-foo

> Note  that  if  you  use rm to remove a file, it is usually possible to recover the contents of that
> file.  If you want more assurance that the contents are truly unrecoverable, consider using shred.

### rmdir ###

> Remove the DIRECTORY(ies), if they are empty.

> --ignore-fail-on-non-empty

> ignore each failure that is solely because a directory is non-empty

> -p, --parents
> > Remove  DIRECTORY  and  its ancestors.  E.g., rmdir -p a/b/c is similar to rmdir a/b/c a/b
> > a.


> -v, --verbose
> > output a diagnostic for every directory processed


> --help display this help and exit

> --version
> > output version information and exit

### sha1sum ###


> Print or check SHA1 (160-bit) checksums.  With no FILE, or when FILE is -, read standard input.

> -b, --binary
> > read in binary mode


> -c, --check
> > read SHA1 sums from the FILEs and check them


> -t, --text
> > read in text mode (default)


> The following two options are useful only when verifying checksums:
> > --status
> > > donât output anything, status code shows success


> -w, --warn
> > warn about improperly formatted checksum lines


> --help display this help and exit

> --version
> > output version information and exit


> The  sums are computed as described in FIPS-180-1.  When checking, the input should be a former output of this program.  The default mode is to print a line with checksum, a character indicating type
> (`*` for binary, " " for text), and name for each FILE.

### seq ###

> Print numbers from FIRST to LAST, in steps of INCREMENT.

> -f, --format=FORMAT
> > use printf style floating-point FORMAT


> -s, --separator=STRING
> > use STRING to separate numbers (default: \n)


> -w, --equal-width
> > equalize width by padding with leading zeroes


> --help display this help and exit

> --version
> > output version information and exit


> If  FIRST  or  INCREMENT  is omitted, it defaults to 1.  That is, an omitted INCREMENT defaults to 1
> even when LAST is smaller than FIRST.  FIRST, INCREMENT, and LAST are interpreted as floating  point
> values.  INCREMENT is usually positive if FIRST is smaller than LAST, and INCREMENT is usually negative if FIRST is greater than LAST.  FORMAT must be suitable for printing one argument of type double;  it defaults to %.PRECf if FIRST, INCREMENT, and LAST are all fixed point decimal numbers with
> maximum precision PREC, and to %g otherwise.

### shred ###

> Overwrite the specified FILE(s) repeatedly, in order to make it harder for even very expensive hardâ
> ware probing to recover the data.

> Mandatory arguments to long options are mandatory for short options too.

> -f, --force
> > change permissions to allow writing if necessary


> -n, --iterations=N
> > Overwrite N times instead of the default (25)


> --random-source=FILE
> > get random bytes from FILE (default /dev/urandom)


> -s, --size=N
> > shred this many bytes (suffixes like K, M, G accepted)


> -u, --remove
> > truncate and remove file after overwriting


> -v, --verbose
> > show progress


> -x, --exact
> > do not round file sizes up to the next full block;


> this is the default for non-regular files

> -z, --zero
> > add a final overwrite with zeros to hide shredding


> --help display this help and exit

> --version
> > output version information and exit


> If FILE is -, shred standard output.

> Delete FILE(s) if --remove (-u) is specified.  The default is not to remove the files because it  is
> common  to  operate  on  device  files like /dev/hda, and those files usually should not be removed.
> When operating on regular files, most people use the --remove option.

> CAUTION: Note that shred relies on a very important assumption: that the file system overwrites data
> in place.  This is the traditional way to do things, but many modern file system designs do not satisfy this assumption.  The following are examples of file systems on which shred is  not  effective,
> or is not guaranteed to be effective in all file system modes:

> `*`  log-structured  or  journaled file systems, such as those supplied with AIX and Solaris (and JFS,
> ReiserFS, XFS, Ext3, etc.)

> `*` file systems that write redundant data and carry on even if some writes fail, such  as  RAID-based
> file systems

> `*` file systems that make snapshots, such as Network Appliance's NFS server

> `*` file systems that cache in temporary locations, such as NFS version 3 clients

> `*` compressed file systems

> In  the case of ext3 file systems, the above disclaimer applies (and shred is thus of limited effectiveness) only in data=journal mode, which journals file data in addition to just metadata.  In both
> the  data=ordered  (default)  and data=writeback modes, shred works as usual.  Ext3 journaling modes
> can be changed by adding the data=something option to the mount options for a particular file system
> in the /etc/fstab file, as documented in the mount man page (man mount).

> In  addition,  file  system backups and remote mirrors may contain copies of the file that cannot be
> removed, and that will allow a shredded file to be recovered later.


### sleep ###

> Pause  for  NUMBER  seconds.   SUFFIX may be s for seconds (the default), m for minutes, h for
> hours or d for days.  Unlike most implementations that require NUMBER be an integer,  here  NUMBER
> may  be  an  arbitrary  floating point number.  Given two or more arguments, pause for the amount of
> time specified by the sum of their values.

> --help display this help and exit

> --version
> > output version information and exit


### sort ###

> Write sorted concatenation of all FILE(s) to standard output.

> Mandatory arguments to long options are mandatory for short options too.  Ordering options:

> -b, --ignore-leading-blanks
> > ignore leading blanks


> -d, --dictionary-order
> > consider only blanks and alphanumeric characters


> -f, --ignore-case
> > fold lower case to upper case characters


> -g, --general-numeric-sort
> > compare according to general numerical value


> -i, --ignore-nonprinting
> > consider only printable characters


> -M, --month-sort
> > compare (unknown) < JAN < ... < DEC


> -n, --numeric-sort
> > compare according to string numerical value


> -R, --random-sort
> > sort by random hash of keys


> --random-source=FILE
> > get random bytes from FILE (default /dev/urandom)


> -r, --reverse
> > reverse the result of comparisons


> Other options:

> -c, --check, --check=diagnose-first
> > check for sorted input; do not sort


> -C, --check=quiet, --check=silent
> > like -c, but do not report first bad line


> --compress-program=PROG
> > compress temporaries with PROG; decompress them with PROG -d


> -k, --key=POS1[,POS2]
> > start a key at POS1, end it at POS2 (origin 1)


> -m, --merge
> > merge already sorted files; do not sort


> -o, --output=FILE
> > write result to FILE instead of standard output


> -s, --stable
> > stabilize sort by disabling last-resort comparison


> -S, --buffer-size=SIZE
> > use SIZE for main memory buffer


> -t, --field-separator=SEP
> > use SEP instead of non-blank to blank transition


> -T, --temporary-directory=DIR
> > use DIR for temporaries, not $TMPDIR or /tmp; multiple options specify multiple directories


> -u, --unique
> > with -c, check for strict ordering; without -c, output only the first of an equal run


> -z, --zero-terminated
> > end lines with 0 byte, not newline


> --help display this help and exit

> --version
> > output version information and exit


> POS  is F[.C][OPTS](OPTS.md), where F is the field number and C the character position in the field; both are
> origin 1.  If neither -t nor -b is in effect, characters in a field are counted from  the  beginning
> of  the  preceding  whitespace.   OPTS is one or more single-letter ordering options, which override
> global ordering options for that key.  If no key is given, use the entire line as the key.

> SIZE may be followed by the following  multiplicative  suffixes:  %  1%  of  memory,  b  1,  K  1024
> (default), and so on for M, G, T, P, E, Z, Y.

> With no FILE, or when FILE is -, read standard input.

> `*** WARNING ***` The locale specified by the environment affects sort order.  Set LC`_`ALL=C to get the
> traditional sort order that uses native byte values.


### split ###

> Output  fixed-size  pieces  of  INPUT  to  PREFIXaa,  PREFIXab, ...; default size is 1000 lines, and
> > default PREFIX is âxâ.  With no INPUT, or when INPUT is -, read standard input.


> Mandatory arguments to long options are mandatory for short options too.

> -a, --suffix-length=N
> > use suffixes of length N (default 2)


> -b, --bytes=SIZE
> > put SIZE bytes per output file


> -C, --line-bytes=SIZE
> > put at most SIZE bytes of lines per output file


> -d, --numeric-suffixes
> > use numeric suffixes instead of alphabetic


> -l, --lines=NUMBER
> > put NUMBER lines per output file


> --verbose
> > print a diagnostic to standard error just before each output file is opened


> --help display this help and exit

> --version
> > output version information and exit


> `SIZE may have a multiplier  suffix:  b  512,  kB  1000,  K  1024,  MB  1000*1000,  M  1024*1024,  GB 1000*1000*1000, G 1024*1024*1024`, and so on for T, P, E, Z, Y.


### stat ###

> Display file or file system status.

> -L, --dereference
> > follow links


> -f, --file-system
> > display file system status instead of file status


> -c  --format=FORMAT
> > use the specified FORMAT instead of the default; output a newline after each use of FORMAT


> --printf=FORMAT
> > like  --format,  but interpret backslash escapes, and do not output a mandatory trailing newline.  If you want a newline, include \n in FORMAT.


> -t, --terse
> > print the information in terse form


> --help display this help and exit

> --version
> > output version information and exit


> The valid format sequences for files (without --file-system):

> %a     Access rights in octal

> %A     Access rights in human readable form

> %b     Number of blocks allocated (see %B)

> %B     The size in bytes of each block reported by %b

> %C     SELinux security context string

> %d     Device number in decimal

> %D     Device number in hex

> %f     Raw mode in hex

> %F     File type

> %g     Group ID of owner

> %G     Group name of owner

> %h     Number of hard links

> %i     Inode number

> %n     File name

> %N     Quoted file name with dereference if symbolic link

> %o     I/O block size

> %s     Total size, in bytes

> %t     Major device type in hex

> %T     Minor device type in hex

> %u     User ID of owner

> %U     User name of owner

> %x     Time of last access

> %X     Time of last access as seconds since Epoch

> %y     Time of last modification

> %Y     Time of last modification as seconds since Epoch

> %z     Time of last change

> %Z     Time of last change as seconds since Epoch

> Valid format sequences for file systems:

> %a     Free blocks available to non-superuser

> %b     Total data blocks in file system

> %c     Total file nodes in file system

> %d     Free file nodes in file system

> %f     Free blocks in file system

> %C     SELinux security context string

> %i     File System ID in hex

> %l     Maximum length of filenames

> %n     File name

> %s     Block size (for faster transfers)

> %S     Fundamental block size (for block counts)

> %t     Type in hex

> %T     Type in human readable form

> NOTE: your shell may have its own version of stat, which usually supersedes  the  version  described
> here.  Please refer to your shell's documentation for details about the options it supports.

### stty ###

> Print or change terminal characteristics.

> -a, --all
> > print all current settings in human-readable form


> -g, --save
> > print all current settings in a stty-readable form


> -F, --file=DEVICE
> > open and use the specified DEVICE instead of stdin


> --help display this help and exit

> --version
> > output version information and exit


> Optional - before SETTING indicates negation.  An `*` marks non-POSIX settings.  The underlying system
> defines which settings are available.

> Special characters:
> > `*` dsusp CHAR
> > > CHAR will send a terminal stop signal once input flushed


> eof CHAR
> > CHAR will send an end of file (terminate the input)


> eol CHAR
> > CHAR will end the line


> `*` eol2 CHAR
> > alternate CHAR for ending the line


> erase CHAR
> > CHAR will erase the last character typed


> intr CHAR
> > CHAR will send an interrupt signal


> kill CHAR
> > CHAR will erase the current line


> `*` lnext CHAR
> > CHAR will enter the next character quoted


> quit CHAR
> > CHAR will send a quit signal


> `*` rprnt CHAR
> > CHAR will redraw the current line


> start CHAR
> > CHAR will restart the output after stopping it


> stop CHAR
> > CHAR will stop the output


> susp CHAR
> > CHAR will send a terminal stop signal


> `*` swtch CHAR
> > CHAR will switch to a different shell layer


> `*` werase CHAR
> > CHAR will erase the last word typed


> Special settings:
> > N      set the input and output speeds to N bauds


> `*` cols N
> > tell the kernel that the terminal has N columns


> `*` columns N
> > same as cols N


> ispeed N
> > set the input speed to N


> `*` line N
> > use line discipline N


> min N  with -icanon, set N characters minimum for a completed read

> ospeed N
> > set the output speed to N


> `*` rows N
> > tell the kernel that the terminal has N rows


> `*` size print the number of rows and columns according to the kernel

> speed  print the terminal speed

> time N with -icanon, set read timeout of N tenths of a second

> Control settings:
> > [-]clocal
> > > disable modem control signals


> [-]cread
> > allow input to be received


> `*` [-]crtscts
> > enable RTS/CTS handshaking


> csN    set character size to N bits, N in [5..8]

> [-]cstopb
> > use two stop bits per character (one with -)


> [-]hup send a hangup signal when the last process closes the tty

> [-]hupcl
> > same as [-]hup


> [-]parenb
> > generate parity bit in output and expect parity bit in input


> [-]parodd
> > set odd parity (even with â-â)


> Input settings:
> > [-]brkint
> > > breaks cause an interrupt signal


> [-]icrnl
> > translate carriage return to newline


> [-]ignbrk
> > ignore break characters


> [-]igncr
> > ignore carriage return


> [-]ignpar
> > ignore characters with parity errors


> `*` [-]imaxbel
> > beep and do not flush a full input buffer on a character


> [-]inlcr
> > translate newline to carriage return


> [-]inpck
> > enable input parity checking


> [-]istrip
> > clear high (8th) bit of input characters


> `*` [-]iutf8
> > assume input characters are UTF-8 encoded


> `*` [-]iuclc
> > translate uppercase characters to lowercase


> `*` [-]ixany
> > let any character restart output, not only start character


> [-]ixoff
> > enable sending of start/stop characters


> [-]ixon
> > enable XON/XOFF flow control


> [-]parmrk
> > mark parity errors (with a 255-0-character sequence)


> [-]tandem
> > same as [-]ixoff


> Output settings:
> > `*` bsN  backspace delay style, N in [0..1]


> `*` crN  carriage return delay style, N in [0..3]

> `*` ffN  form feed delay style, N in [0..1]

> `*` nlN  newline delay style, N in [0..1]

> `*` [-]ocrnl
> > translate carriage return to newline


> `*` [-]ofdel
> > use delete characters for fill instead of null characters


> `*` [-]ofill
> > use fill (padding) characters instead of timing for delays


> `*` [-]olcuc
> > translate lowercase characters to uppercase


> `*` [-]onlcr
> > translate newline to carriage return-newline


> `*` [-]onlret
> > newline performs a carriage return


> `*` [-]onocr
> > do not print carriage returns in the first column


> [-]opost
> > postprocess output


> `*` tabN horizontal tab delay style, N in [0..3]

> `*` tabs same as tab0

> `*` -tabs
> > same as tab3


> `*` vtN  vertical tab delay style, N in [0..1]

> Local settings:
> > [-]crterase
> > > echo erase characters as backspace-space-backspace


> `*` crtkill
> > kill all line by obeying the echoprt and echoe settings


> `*` -crtkill
> > kill all line by obeying the echoctl and echok settings


> `*` [-]ctlecho
> > echo control characters in hat notation (^c)


> [-]echo
> > echo input characters


> `*` [-]echoctl
> > same as [-]ctlecho


> [-]echoe
> > same as [-]crterase


> [-]echok
> > echo a newline after a kill character


> `*` [-]echoke
> > same as [-]crtkill


> [-]echonl
> > echo newline even if not echoing other characters


> `*` [-]echoprt
> > echo erased characters backward, between â\â and â/â


> [-]icanon
> > enable erase, kill, werase, and rprnt special characters


> [-]iexten
> > enable non-POSIX special characters


> [-]isig
> > enable interrupt, quit, and suspend special characters


> [-]noflsh
> > disable flushing after interrupt and quit special characters


> `*` [-]prterase
> > same as [-]echoprt


> `*` [-]tostop
> > stop background jobs that try to write to the terminal


> `*` [-]xcase
> > with icanon, escape with \ for uppercase characters


> Combination settings:
> > `*` [-]LCASE
> > > same as [-]lcase


> cbreak same as -icanon

> -cbreak
> > same as icanon


> cooked same as brkint ignpar istrip icrnl ixon opost isig icanon, eof and eol  characters  to  their
> > default values


> -cooked
> > same as raw


> crt    same as echoe echoctl echoke

> dec    same as echoe echoctl echoke -ixany intr <sup>c erase 0177 kill </sup>u

> `*` [-]decctlq
> > same as [-]ixany


> ek     erase and kill characters to their default values

> evenp  same as parenb -parodd cs7

> -evenp same as -parenb cs8

> `*` [-]lcase
> > same as xcase iuclc olcuc


> litout same as -parenb -istrip -opost cs8

> -litout
> > same as parenb istrip opost cs7


> nl     same as -icrnl -onlcr

> -nl    same as icrnl -inlcr -igncr onlcr -ocrnl -onlret

> oddp   same as parenb parodd cs7

> -oddp  same as -parenb cs8

> [-]parity
> > same as [-]evenp


> pass8  same as -parenb -istrip cs8

> -pass8 same as parenb istrip cs7

> raw    same  as  -ignbrk  -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl  -ixon  -ixoff
> > -iuclc  -ixany -imaxbel -opost -isig -icanon -xcase min 1 time 0


> -raw   same as cooked

> sane   same as cread -ignbrk brkint -inlcr -igncr icrnl -iutf8 -ixoff -iuclc  -ixany  imaxbel  opost
> > -olcuc  -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0 isig icanon iexten
> > echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke, all special  characters to their default values.


> Handle  the  tty line connected to standard input.  Without arguments, prints baud rate, line discipline, and deviations from stty sane.  In settings, CHAR is taken literally,  or  coded  as  in  ^c,
> `0x37, 0177 or 127; special values ^- or undef used to disable special characters.`


### sum ###

> Print checksum and block counts for each FILE.

> -r     defeat -s, use BSD sum algorithm, use 1K blocks

> -s, --sysv
> > use System V sum algorithm, use 512 bytes blocks


> --help display this help and exit

> --version
> > output version information and exit


> With no FILE, or when FILE is -, read standard input.


### sync ###

> Force changed blocks to disk, update the super block.

> --help display this help and exit

> --version
> > output version information and exit

### tac ###


> Write each FILE to standard output, last line first.  With no FILE, or when FILE is -, read standard
> > input.


> Mandatory arguments to long options are mandatory for short options too.

> -b, --before
> > attach the separator before instead of after


> -r, --regex
> > interpret the separator as a regular expression


> -s, --separator=STRING
> > use STRING as the separator instead of newline


> --help display this help and exit

> --version
> > output version information and exit


### tail ###


> Print the last 10 lines of each FILE to standard output.  With more than one FILE, precede each with
> > a header giving the file name.  With no FILE, or when FILE is -, read standard input.


> Mandatory arguments to long options are mandatory for short options too.

> --retry
> > keep trying to open a file even if it is inaccessible when tail starts or if it becomes inaccessible later; useful when following by name, i.e., with --follow=name


> -c, --bytes=N
> > output  the last N bytes; alternatively, use +N to output bytes starting with the Nth of each
> > file


> -f, --follow[={name|descriptor}]
> > output appended data as the file grows; -f, --follow, and --follow=descriptor are equivalent


> -F     same as --follow=name --retry

> -n, --lines=N
> > output the last N lines, instead of the last 10; or use +N to output lines starting with  the
> > Nth


> --max-unchanged-stats=N
> > with  --follow=name,  reopen a FILE which has not changed size after N (default 5) iterations
> > to see if it has been unlinked or renamed (this is the usual case of rotated log files)


> --pid=PID
> > with -f, terminate after process ID, PID dies


> -q, --quiet, --silent
> > never output headers giving file names


> -s, --sleep-interval=S
> > with -f, sleep for approximately S seconds (default 1.0) between iterations.


> -v, --verbose
> > always output headers giving file names


> --help display this help and exit

> --version
> > output version information and exit


> If the first character of N (the number of bytes or lines) is a â+â, print beginning  with  the  Nth
> item  from the start of each file, otherwise, print the last N items in the file.  `N may have a multiplier suffix:  b  512,  kB  1000,  K  1024,  MB  1000*1000,  M  1024*1024,  GB  1000*1000*1000,  G 1024*1024*1024, and so on for T, P, E, Z, Y.`

> With  --follow  (-f),  tail  defaults  to  following the file descriptor, which means that even if a
> tailed file is renamed, tail will continue to track its end.  This default behavior is  not  desirable  when  you really want to track the actual name of the file, not the file descriptor (e.g., log
> rotation).  Use --follow=name in that case.  That causes tail to track the named file  by  reopening
> it periodically to see if it has been removed and recreated by some other program.


### tee ###

> Copy standard input to each FILE, and also to standard output.

> -a, --append
> > append to the given FILEs, do not overwrite


> -i, --ignore-interrupts
> > ignore interrupt signals


> --help display this help and exit

> --version
> > output version information and exit


> If a FILE is -, copy again to standard output.


### test ###

> Exit with the status determined by EXPRESSION.

> --help display this help and exit

> --version
> > output version information and exit


> An  omitted EXPRESSION defaults to false.  Otherwise, EXPRESSION is true or false and sets exit status.  It is one of:

> ( EXPRESSION )
> > EXPRESSION is true


> ! EXPRESSION
> > EXPRESSION is false


> EXPRESSION1 -a EXPRESSION2
> > both EXPRESSION1 and EXPRESSION2 are true


> EXPRESSION1 -o EXPRESSION2
> > either EXPRESSION1 or EXPRESSION2 is true


> -n STRING
> > the length of STRING is nonzero


> STRING equivalent to -n STRING

> -z STRING
> > the length of STRING is zero


> STRING1 = STRING2
> > the strings are equal


> STRING1 != STRING2
> > the strings are not equal


> INTEGER1 -eq INTEGER2
> > INTEGER1 is equal to INTEGER2


> INTEGER1 -ge INTEGER2
> > INTEGER1 is greater than or equal to INTEGER2


> INTEGER1 -gt INTEGER2
> > INTEGER1 is greater than INTEGER2


> INTEGER1 -le INTEGER2
> > INTEGER1 is less than or equal to INTEGER2


> INTEGER1 -lt INTEGER2
> > INTEGER1 is less than INTEGER2


> INTEGER1 -ne INTEGER2
> > INTEGER1 is not equal to INTEGER2


> FILE1 -ef FILE2
> > FILE1 and FILE2 have the same device and inode numbers


> FILE1 -nt FILE2
> > FILE1 is newer (modification date) than FILE2


> FILE1 -ot FILE2
> > FILE1 is older than FILE2


> -b FILE
> > FILE exists and is block special


> -c FILE
> > FILE exists and is character special


> -d FILE
> > FILE exists and is a directory


> -e FILE
> > FILE exists


> -f FILE
> > FILE exists and is a regular file


> -g FILE
> > FILE exists and is set-group-ID


> -G FILE
> > FILE exists and is owned by the effective group ID


> -h FILE
> > FILE exists and is a symbolic link (same as -L)


> -k FILE
> > FILE exists and has its sticky bit set


> -L FILE
> > FILE exists and is a symbolic link (same as -h)


> -O FILE
> > FILE exists and is owned by the effective user ID


> -p FILE
> > FILE exists and is a named pipe


> -r FILE
> > FILE exists and read permission is granted


> -s FILE
> > FILE exists and has a size greater than zero


> -S FILE
> > FILE exists and is a socket


> -t FD  file descriptor FD is opened on a terminal

> -u FILE
> > FILE exists and its set-user-ID bit is set


> -w FILE
> > FILE exists and write permission is granted


> -x FILE
> > FILE exists and execute (or search) permission is granted


> Except for -h and -L, all FILE-related tests dereference symbolic links.   Beware  that  parentheses
> need  to  be escaped (e.g., by backslashes) for shells.  INTEGER may also be -l STRING, which evaluates to the length of STRING.

> NOTE: [ honors the --help and --version options, but test does not.  test treats each of those as it
> treats any other nonempty STRING.

> NOTE:  your  shell  may  have its own version of test and/or [, which usually supersedes the version
> described here.  Please refer to your shell's documentation for details about the  options  it  supports.


### touch ###

> Update the access and modification times of each FILE to the current time.

> A FILE argument that does not exist is created empty.

> A  FILE  argument  string of - is handled specially and causes touch to change the times of the file
> associated with standard output.

> Mandatory arguments to long options are mandatory for short options too.

> -a     change only the access time

> -c, --no-create
> > do not create any files


> -d, --date=STRING
> > parse STRING and use it instead of current time


> -f     (ignored)

> -m     change only the modification time

> -r, --reference=FILE
> > use this file's times instead of current time


> -t STAMP
> > use [[CC](CC.md)YY]MMDDhhmm[.ss] instead of current time


> --time=WORD
> > change the specified time: WORD is access, atime, or use: equivalent to -a WORD is modify  or
> > mtime: equivalent to -m


> --help display this help and exit

> --version
> > output version information and exit


> Note that the -d and -t options accept different time-date formats.

### tr ###

> Translate, squeeze, and/or delete characters from standard input, writing to standard output.

> -c, -C, --complement
> > first complement SET1


> -d, --delete
> > delete characters in SET1, do not translate


> -s, --squeeze-repeats
> > replace  each  input  sequence  of  a repeated character that is listed in SET1 with a single
> > occurrence of that character


> -t, --truncate-set1
> > first truncate SET1 to length of SET2


> --help display this help and exit

> --version
> > output version information and exit


> SETs are specified as strings of characters.  Most represent themselves.  Interpreted sequences are:

> \NNN   character with octal value NNN (1 to 3 octal digits)

> \\     backslash

> \a     audible BEL

> \b     backspace

> \f     form feed

> \n     new line

> \r     return

> \t     horizontal tab

> \v     vertical tab

> CHAR1-CHAR2
> > all characters from CHAR1 to CHAR2 in ascending order


> [CHAR**]
> > in SET2, copies of CHAR until length of SET1**


> [CHAR\*REPEAT]
> > REPEAT copies of CHAR, REPEAT octal if starting with 0


> [:alnum:]
> > all letters and digits


> [:alpha:]
> > all letters


> [:blank:]
> > all horizontal whitespace


> [:cntrl:]
> > all control characters


> [:digit:]
> > all digits


> [:graph:]
> > all printable characters, not including space


> [:lower:]
> > all lower case letters


> [:print:]
> > all printable characters, including space


> [:punct:]
> > all punctuation characters


> [:space:]
> > all horizontal or vertical whitespace


> [:upper:]
> > all upper case letters


> [:xdigit:]
> > all hexadecimal digits


> [=CHAR=]
> > all characters which are equivalent to CHAR


> Translation  occurs  if  -d  is  not  given and both SET1 and SET2 appear.  -t may be used only when
> translating.  SET2 is extended to length of SET1 by  repeating  its  last  character  as  necessary.
> Excess  characters  of  SET2  are ignored.  Only [:lower:] and [:upper:] are guaranteed to expand in
> ascending order; used in SET2 while translating, they may only be used in pairs to specify case conversion.   -s  uses  SET1 if not translating nor deleting; else squeezing uses SET2 and occurs after
> translation or deletion.


### true ###

> Exit with a status code indicating success.

> --help display this help and exit

> --version
> > output version information and exit


> NOTE:  your  shell  may have its own version of true, which usually supersedes the version described
> here.  Please refer to your shell's documentation for details about the options it supports.


### tsort ###

> Write totally ordered list consistent with the partial ordering in FILE.  With no FILE, or when FILE
> > is -, read standard input.


> --help display this help and exit

> --version
> > output version information and exit


### tty ###


> Print the file name of the terminal connected to standard input.

> -s, --silent, --quiet
> > print nothing, only return an exit status


> --help display this help and exit

> --version
> > output version information and exit


### uname ###


> Print certain system information.  With no OPTION, same as -s.

> -a, --all
> > print all information, in the following order, except omit -p and -i if unknown:


> -s, --kernel-name
> > print the kernel name


> -n, --nodename
> > print the network node hostname


> -r, --kernel-release
> > print the kernel release


> -v, --kernel-version
> > print the kernel version


> -m, --machine
> > print the machine hardware name


> -p, --processor
> > print the processor type or "unknown"


> -i, --hardware-platform
> > print the hardware platform or "unknown"


> -o, --operating-system
> > print the operating system


> --help display this help and exit

> --version
> > output version information and exit


### unexpand ###


> Convert  blanks  in each FILE to tabs, writing to standard output.  With no FILE, or when FILE is -,
> > read standard input.


> Mandatory arguments to long options are mandatory for short options too.

> -a, --all
> > convert all blanks, instead of just initial blanks


> --first-only
> > convert only leading sequences of blanks (overrides -a)


> -t, --tabs=N
> > have tabs N characters apart instead of 8 (enables -a)


> -t, --tabs=LIST
> > use comma separated LIST of tab positions (enables -a)


> --help display this help and exit

> --version
> > output version information and exit


### uniq ###

SCRIPTION

> Discard  all but one of successive identical lines from INPUT (or standard input), writing to OUTPUT
> (or standard output).

> Mandatory arguments to long options are mandatory for short options too.

> -c, --count
> > prefix lines by the number of occurrences


> -d, --repeated
> > only print duplicate lines


> -D, --all-repeated[=delimit-method]
> > print all duplicate lines delimit-method={none(default),prepend,separate} Delimiting is  done
> > with blank lines.


> -f, --skip-fields=N
> > avoid comparing the first N fields


> -i, --ignore-case
> > ignore differences in case when comparing


> -s, --skip-chars=N
> > avoid comparing the first N characters


> -u, --unique
> > only print unique lines


> -z, --zero-terminated
> > end lines with 0 byte, not newline


> -w, --check-chars=N
> > compare no more than N characters in lines


> --help display this help and exit

> --version
> > output version information and exit


> A field is a run of whitespace, then non-whitespace characters.  Fields are skipped before chars.

> Note:  uniq  does  not  detect  repeated lines unless they are adjacent.  You may want to sort the
> input first, or use "sort -u" without uniq.


### unlink ###

> Call the unlink function to remove the specified FILE.

> --help display this help and exit

> --version
> > output version information and exit


### users ###


> Output  who  is currently logged in according to FILE.  If FILE is not specified, use /var/run/utmp.
> > /var/log/wtmp as FILE is common.


> --help display this help and exit

> --version
> > output version information and exit


### vdir ###


> List information about the FILEs (the current directory by default).  Sort entries alphabetically if
> none of -cftuvSUX nor --sort.

> Mandatory arguments to long options are mandatory for short options too.

> -a, --all
> > do not ignore entries starting with .


> -A, --almost-all
> > do not list implied . and ..


> --author
> > with -l, print the author of each file


> -b, --escape
> > print octal escapes for nongraphic characters


> --block-size=SIZE
> > use SIZE-byte blocks


> -B, --ignore-backups
> > do not list implied entries ending with ~


> -c     with -lt: sort by, and show, ctime (time of last modification  of  file  status  information)
> > with -l: show ctime and sort by name otherwise: sort by ctime


> -C     list entries by columns

> --color[=WHEN]
> > control  whether  color is used to distinguish file types.  WHEN may be never, always, or
> > auto


> -d, --directory
> > list directory entries instead of contents, and do not dereference symbolic links


> -D, --dired
> > generate output designed for Emacsâ dired mode


> -f     do not sort, enable -aU, disable -ls --color

> -F, --classify
> > append indicator (one of `*/=>@|`) to entries


> --file-type
> > likewise, except do not append `*`


> --format=WORD
> > across -x, commas -m, horizontal -x, long -l, single-column -1, verbose -l, vertical -C


> --full-time
> > like -l --time-style=full-iso


> -g     like -l, but do not list owner

> --group-directories-first
> > group directories before files


> -G, --no-group
> > in a long listing, donât print group names


> -h, --human-readable
> > with -l, print sizes in human readable format (e.g., 1K 234M 2G)


> --si   likewise, but use powers of 1000 not 1024

> -H, --dereference-command-line
> > follow symbolic links listed on the command line


> --dereference-command-line-symlink-to-dir
> > follow each command line symbolic link that points to a directory


> --hide=PATTERN
> > do not list implied entries matching shell PATTERN (overridden by -a or -A)


> --indicator-style=WORD
> > append indicator with style WORD to  entry  names:  none  (default),  slash  (-p),  file-type
> > (--file-type), classify (-F)


> -i, --inode
> > print the index number of each file


> -I, --ignore=PATTERN
> > do not list implied entries matching shell PATTERN


> -k     like --block-size=1K

> -l     use a long listing format

> -L, --dereference
> > when  showing  file  information  for a symbolic link, show information for the file the link
> > references rather than for the link itself


> -m     fill width with a comma separated list of entries

> -n, --numeric-uid-gid
> > like -l, but list numeric user and group IDs


> -N, --literal
> > print raw entry names (donât treat e.g. control characters specially)


> -o     like -l, but do not list group information

> -p, --indicator-style=slash
> > append / indicator to directories


> -q, --hide-control-chars
> > print ? instead of non graphic characters


> --show-control-chars
> > show non graphic characters as-is (default unless program is âlsâ and output is a terminal)


> -Q, --quote-name
> > enclose entry names in double quotes


> --quoting-style=WORD
> > use quoting style WORD for entry names: literal, locale, shell, shell-always, c, escape


> -r, --reverse
> > reverse order while sorting


> -R, --recursive
> > list subdirectories recursively


> -s, --size
> > print the size of each file, in blocks


> -S     sort by file size

> --sort=WORD
> > sort by WORD instead of name: none -U, extension -X, size -S, time -t, version -v


> --time=WORD
> > with -l, show time as WORD instead of modification time: atime -u, access -u, use  -u,  ctime
> > -c, or status -c; use specified time as sort key if --sort=time


> --time-style=STYLE
> > with  -l,  show times using style STYLE: full-iso, long-iso, iso, locale, +FORMAT.  FORMAT is
> > interpreted like âdateâ; if FORMAT is FORMAT1

&lt;newline&gt;

FORMAT2, FORMAT1 applies to  non-recent
> > files  and  FORMAT2  to  recent files; if STYLE is prefixed with posix-, STYLE takes effect
> > only outside the POSIX locale


> -t     sort by modification time

> -T, --tabsize=COLS
> > assume tab stops at each COLS instead of 8


> -u     with -lt: sort by, and show, access time with -l: show access time and sort  by  name  otherwise: sort by access time

> -U     do not sort; list entries in directory order

> -v     sort by version

> -w, --width=COLS
> > assume screen width instead of current value


> -x     list entries by lines instead of by columns

> -X     sort alphabetically by entry extension

> -Z, --context
> > print any SELinux security context of each file


> -1     list one file per line

> --help display this help and exit

> --version
> > output version information and exit


> SIZE  may  be  (or  may  be an integer optionally followed by) one of following: `kB 1000, K 1024, MB 1000*1000, M 1024*1024, and so on for G, T, P, E, Z, Y.`

> By default, color is not  used  to  distinguish  types  of  files.   That  is  equivalent  to  using
> --color=none.   Using  the  --color option without the optional WHEN argument is equivalent to using
> --color=always.  With --color=auto, color codes are output only if standard output is connected to a
> terminal  (tty).  The environment variable LS\_COLORS can influence the colors, and can be set easily
> by the dircolors command.

> Exit status is 0 if OK, 1 if minor problems, 2 if serious trouble.


### wc ###

> Print newline, word, and byte counts for each FILE, and a total line if more than one FILE is speciâ
> fied.  With no FILE, or when FILE is -, read standard input.

> -c, --bytes
> > print the byte counts


> -m, --chars
> > print the character counts


> -l, --lines
> > print the newline counts


> --files0-from=F
> > read input from the files specified by NUL-terminated names in file F


> -L, --max-line-length
> > print the length of the longest line


> -w, --words
> > print the word counts


> --help display this help and exit

> --version
> > output version information and exit


### who ###


> print active processes spawned by init

> -q, --count
> > all login names and number of users logged on


> -r, --runlevel
> > print current runlevel


> -s, --short
> > print only name, line, and time (default)


> -t, --time
> > print last system clock change


> -T, -w, --mesg
> > add userâs message status as +, - or ?


> -u, --users
> > list users logged in


> --message
> > same as -T


> --writable
> > same as -T


> --help display this help and exit

> --version
> > output version information and exit


> If FILE is not specified, use /var/run/utmp.  /var/log/wtmp as FILE is common.  If ARG1 ARG2  given,
-m presumed: am i or mom likes are usual.

### whoami ###

> Print the user name associated with the current effective user ID.  Same as id -un.

> --help display this help and exit

> --version
> > output version information and exit


### yes ###


> Repeatedly output a line with all specified STRING(s), or y.

> --help display this help and exit

> --version
> > output version information and exit


## Disk Utils ##

### parted ###


> parted  is  a  disk  partitioning and partition resizing program.  It allows you to create, destroy,
> > resize, move and copy ext2, ext3, linux-swap, FAT, FAT32, and reiserfs partitions.  It  can  create,
> > resize, and move Macintosh HFS partitions, as well as detect jfs, ntfs, ufs, and xfs partitions.  It
> > is useful for creating space for new operating systems, reorganising disk usage, and copying data to
> > new hard disks.


> This  manual  page documents parted briefly.  Complete documentation is distributed with the package
> in GNU Info format; see near the bottom.

OPTIONS
> -h, --help
> > displays a help message


> -i, --interactive
> > prompts for user intervention


> -l, --list
> > lists partition layout on all block devices


> -m, --machine
> > displays machine parseable output


> -s, --script
> > never prompts for user intervention


> -v, --version
> > displays the version

COMMANDS

> [device](device.md)
> > The block device to be used.  When none is given, parted will use the first block  device  it
> > finds.


> [[options](command.md)]
> > Specifies  the command to be executed.  If no command is given, parted will present a command
> > prompt.  Possible commands are:


> check partition
> > Do a simple check on partition.


> cp [source-device] source dest
> > Copy the source partition's filesystem on source-device (or the current device  if  no
> > other device was specified) to the dest partition on the current device.


> help [command](command.md)
> > Print general help, or help on command if specified.


> mkfs partition fs-type
> > Make  a  filesystem  fs-type  on  partition.  fs-type  can be one of "fat16", "fat32",
> > "ext2", "linux-swap", or "reiserfs".


> mklabel label-type
> > Create a new disklabel (partition table) of label-type.  label-type should be  one  of
> > "bsd", "dvh", "gpt", "loop", "mac", "msdos", "pc98", or "sun".


> mkpart part-type [fs-type] start end
> > Make  a part-type partition with filesystem fs-type (if specified), beginning at start
> > and ending at end (by default in megabytes).  fs-type can be one of "fat16",  "fat32",
> > "ext2", "HFS", "linux-swap", "NTFS", "reiserfs", or "ufs".  part-type should be one of
> > "primary", "logical", or "extended".


> mkpartfs part-type fs-type start end
> > Make a part-type partition with filesystem fs-type beginning at start  and  ending  at
> > end (by default in megabytes).


> move partition start end
> > Move  partition  so that it begins at start and ends at end.  Note: move never changes
> > the minor number.


> name partition name
> > Set the name of partition to name. This option  works  only  on  Mac,  PC98,  and  GPT
> > disklabels. The name can be placed in quotes, if necessary.


> print  Display the partition table.

> quit   Exit from parted.

> rescue start end
> > Rescue a lost partition that was located somewhere between start and end.  If a partition is found, parted will ask if you want to create an entry for it in the  partition
> > table.


> resize partition start end
> > Resize  the  filesystem  on  partition  so that it begins at start and ends at end (by
> > default in megabytes).


> rm partition
> > Delete partition.


> select device
> > Choose device as the current device to edit. device should usually  be  a  Linux  hard
> > disk device, but it can be a partition, software raid device, or an LVM logical volume
> > if necessary.


> set partition flag state
> > Change the state of the flag on partition to  state.   Supported  flags  are:  "boot",
> > "root",  "swap",  "hidden",  "raid", "lvm", "lba", and "palo".  state should be either
> > "on" or "off".


> unit unit
> > Set unit as the unit to use when displaying locations and sizes, and for  interpreting
> > those  given  by the user when not suffixed with an explicit unit.  unit can be one of
> > "s" (sectors), "B" (bytes), "kB", "MB", "GB", "TB", "%" (percentage of  device  size),
> > "cyl"  (cylinders),  "chs"  (cylinders,  heads,  sectors), or "compact" (megabytes for
> > input, and a human-friendly form for output).


> version
> > Display version information and a copyright message.

KNOWN ISSUES

> ext3 filesystem resizing does not currently work, please use resize2fs(8) instead.

> Resizing partitions with an ext3 filesystem will not generally work because of the above issue.  Use
> resize2fs(8)  to resize the filesystem and resize the partition manually using fdisk(8) or a similar
> tool.  For LVM situations, you will need to use the LVM commands to resize the LVM elements.

## e2fsprogs ##
The ext2, ext3 and ext4 file systems are successors of the original ext
> ("extended") file system. They are the main file system types used for
> hard disks on Debian and other Linux systems.
> .
> This package contains programs for creating, checking, and maintaining
> ext-based file systems, and the generic fsck wrapper.

### badblocks ###

> badblocks  is  used  to search for bad blocks on a device (usually a disk partition).  device is the
> > special file corresponding to the device (e.g /dev/hdc1).   last-block  is  the  last  block  to  be
> > checked;  if it is not specified, the last block on the device is used as a default.  first-block is
> > an optional parameter specifying the starting block number for the test, which allows the testing to
> > start  in  the  middle of the disk.  If it is not specified the first block on the disk is used as a
> > default.


> Important note: If the output of badblocks is going to be fed to the e2fsck or mke2fs  programs,  it
> is  important that the block size is properly specified, since the block numbers which are generated
> are very dependent on the block size in use by the filesystem.  For this reason, it is strongly recommended  that  users  not  run  badblocks  directly, but rather use the -c option of the e2fsck and
> mke2fs programs.

OPTIONS
> -b block-size
> > Specify the size of blocks in bytes.  The default is 1024.


> -c number of blocks
> > is the number of blocks which are tested at a time.  The default is 64.


> -e max bad block count
> > Specify a maximum number of bad blocks before aborting the test.  The default is  0,  meaning
> > the test will continue until the end of the test range is reached.


> -d read delay factor
> > This parameter, if passed and non-zero, will cause bad blocks to sleep between reads if there
> > were no errors encountered in the read operation; the delay will be calculated as a  percentage  of  the  time it took for the read operation to be performed. In other words, a value of
    1. 0 will cause each read to be delayed by the amount the previous read took, and a  value  of
> > 200 by twice the amount.


> -f     Normally,  badblocks  will  refuse  to  do a read/write or a non-destructive test on a device
> > which is mounted, since either can cause the system to potentially crash  and/or  damage  the
> > filesystem  even  if  it is mounted read-only.  This can be overridden using the -f flag, but
> > should almost never be used --- if you think you're smarter than the badblocks  program,  you
> > almost  certainly  aren't.   The  only  time  when this option might be safe to use is if the
> > /etc/mtab file is incorrect, and the device really isn't mounted.


> -i input`_`file
> > Read a list of already existing known bad blocks.  Badblocks will skip testing  these  blocks
> > since  they  are  known  to be bad.  If input`_`file is specified as "-", the list will be read
> > from the standard input.  Blocks listed in this list will be omitted from the list of new bad
> > blocks  produced  on the standard output or in the output file.  The -b option of dumpe2fs(8)
> > can be used to retrieve the list of blocks currently marked bad on an existing filesystem, in
> > a format suitable for use with this option.


> -o output`_`file
> > Write  the list of bad blocks to the specified file.  Without this option, badblocks displays
> > the list on its standard output.  The format of this file is  suitable  for  use  by  the  -l
> > option in e2fsck(8) or mke2fs(8).


> -p num`_`passes
> > Repeat  scanning  the disk until there are no new blocks discovered in num`_`passes consecutive
> > scans of the disk.  Default is 0, meaning badblocks will exit after the first pass.


> -t test`_`pattern
> > Specify a test pattern to be read (and written) to disk blocks.   The test`_`pattern may either
> > be a numeric value between 0 and ULONG`_`MAX-1 inclusive, or the word "random", which specifies
> > that the block should be filled with a random bit pattern.   For  read/write  (-w)  and  non-
> > destructive  (-n)  modes,  one  or  more  test patterns may be specified by specifying the -t
> > option for each test pattern desired.  For read-only mode only a single pattern may be specified and it may not be "random".  Read-only testing with a pattern assumes that the specified
> > pattern has previously been written to the disk - if not, large numbers of blocks  will  fail
> > verification.   If  multiple  patterns  are specified then all blocks will be tested with one
> > pattern before proceeding to the next pattern.


> -n     Use non-destructive read-write mode.  By default only a  non-destructive  read-only  test  is
> > done.  This option must not be combined with the -w option, as they are mutually exclusive.


> -s     Show the progress of the scan by writing out the block numbers as they are checked.

> -v     Verbose mode.

> -w     Use  write-mode  test.  With this option, badblocks scans for bad blocks by writing some patterns (0xaa, 0x55, 0xff, 0x00) on every block of the device, reading every block and  comparing  the  contents.  This option may not be combined with the -n option, as they are mutually
> > exclusive.


> -X     Internal flag only to be used by e2fsck(8) and mke2fs(8).  It bypasses the exclusive mode in-
> > use device safety check.

WARNING

> Never  use  the  -w option on a device containing an existing file system.  This option erases data!
> If you want to do write-mode testing on an existing file system, use the -n option instead.   It  is
> slower, but it will preserve your data.

> The  -e option will cause badblocks to output a possibly incomplete list of bad blocks. Therefore it
> is recommended to use it only when one wants to know if there are any  bad  blocks  at  all  on  the
> > device, and not when the list of bad blocks is wanted.


### blkid ###

> The blkid program is the command-line interface to working with libblkid(3) library.  It can  determine  the type of content (e.g. filesystem, swap) a block device holds, and also attributes (tokens,
> > NAME=value pairs) from the content metadata (e.g. LABEL or UUID fields).


> blkid has two main forms of operation: either searching for a  device  with  a  specific  NAME=value
> pair, or displaying NAME=value pairs for one or more devices.


### e2fsck ###

> -c cachefile
> > Read  from  cachefile  instead of reading from the default cache file /etc/blkid.tab.  If you
> > want to start with a clean cache (i.e. don't report devices previously scanned but not necessarily available at this time), specify /dev/null.


> -g     Perform a garbage collection pass on the blkid cache to remove devices which no longer exist.

> -h     Display a usage message and exit.

> -l     Look up one device that matches the search parameter specified using the -t option.  If there
> > are  multiple  devices  that  match  the specified search parameter, then the device with the
> > highest priority is returned, and/or the first device found  at  a  given  priority.   Device
> > types  in  order of decreasing priority are Device Mapper, EVMS, LVM, MD, and finally regular
> > block devices.  If this option is not specified, blkid will print all  of  the  devices  that
> > match the search parameter.


> -o format
> > Display  blkid's  output  using  the specified format.  The format parameter may be full (the
> > default), value (only print the value of the tags),  list  (print  the  devices  in  a  user-
> > friendly format), or device (only print the device name).


> -L     Print the devices in a user-friendly list format.  This is the equivalent of using the option
> > -o list.


> -s tag For each (specified) device, show only the tags that match tag.  It is  possible  to  specify
> > multiple  -s  options.  If no tag is specified, then all tokens are shown for all (specified)
> > devices.  In order to just refresh the cache without showing any tokens, use -s none with  no
> > other options.


> -t NAME=value
> > Search  for  block  devices with tokens named NAME that have the value value, and display any
> > devices which are found.  Common values for NAME include TYPE, LABEL, and UUID.  If there are
> > no  devices specified on the command line, all block devices will be searched; otherwise only
> > the specified devices are searched.


> -v     Display version number and exit.

> -w writecachefile
> > Write the device cache to writecachefile instead of writing it  to  the  default  cache  file
> > /etc/blkid.tab.   If you don't want to save the cache to the default file, specify /dev/null.
> > If not specified it will be the same file as that given by the -c option.


> device Display tokens from only the specified device.   It  is  possible  to  give  multiple  device
> > options  on the command line.  If none is given, all devices which appear in /proc/partitions
> > are shown, if they are recognized.
RETURN CODE

> If the specified token was found, or if any tags were shown from (specified) devices, 0 is returned.
> If the specified token was not found, or no (specified) devices could be identified, an exit code of
> 2 is returned.  For usage or other errors, an exit code of 4 is returned.


### mke2fs ###

> mke2fs is used to create an ext2/ext3 filesystem (usually in a disk partition).  device is the  special  file corresponding to the device (e.g /dev/hdXX).  blocks-count is the number of blocks on the
> > device.  If omitted, mke2fs automagically figures the file system size.  If called  as  mkfs.ext3  a
> > journal is created as if the -j option was specified.


> -b block-size
> > Specify  the  size of blocks in bytes.  Valid block-size values are 1024, 2048 and 4096 bytes
> > per block.  If omitted, block-size is heuristically determined by the filesystem size and the
> > expected usage of the filesystem (see the -T option).  If block-size is negative, then mke2fs
> > will use heuristics to determine the appropriate block size, with  the  constraint  that  the
> > block  size  will  be at least block-size bytes.  This is useful for certain hardware devices
> > which require that the blocksize be a multiple of 2k.


> -c     Check the device for bad blocks before creating the file system.  If this option is specified
> > twice, then a slower read-write test is used instead of a fast read-only test.


> -E extended-options
> > Set  extended options for the filesystem.  Extended options are comma separated, and may take
> > an argument using the equals (=) sign.  The -E option used to be -R in earlier versions  of
> > mke2fs.   The  -R  option  is  still  accepted  for  backwards compatibility.   The following
> > extended options are supported:


> stride=stride-size
> > Configure the filesystem for a RAID array  with  stride-size  filesystem  blocks.
> > This  is  the  number of blocks read or written to disk before moving to the next
> > disk, which is sometimes referred to as the  chunk  size.   This  mostly  affects
> > placement  of  filesystem  metadata  like bitmaps at mke2fs time to avoid placing
> > them on a single disk, which can hurt performance.  It may also be  used  by  the
> > block allocator.


> stripe-width=stripe-width
> > Configure the filesystem for a RAID array with stripe-width filesystem blocks per
> > stripe. This is typically stride-size `*` N, where N is the number of  data-bearing
> > disks  in  the  RAID  (e.g. for RAID 5 there is one parity disk, so N will be the
> > number of disks in the array minus 1).  This allows the block allocator  to  prevent  read-modify-write  of the parity in a RAID stripe if possible when the data
> > is written.


> resize=max-online-resize
> > Reserve enough space so that the block group descriptor table can grow to support
> > a filesystem that has max-online-resize blocks.


> `lazy_itable_init`[= <0 to disable, 1 to enable>]
> > If  enabled  and  the  uninit`_`bg  feature is enabled, the inode table will not be
> > fully initialized by mke2fs.  This speeds up  filesystem  initialization  noticeably,  but  it  requires  the kernel to finish initializing the filesystem in the
> > background when the filesystem is first mounted.  If the option value is omitted,
> > it defaults to 1 to enable lazy inode table initialization.



> test`_`fs
> > Set  a  flag in the filesystem superblock indicating that it may be mounted using
> > experimental kernel code, such as the ext4dev filesystem.


> -f fragment-size
> > Specify the size of fragments in bytes.


> -F     Force mke2fs to create a filesystem, even if the specified device is not  a  partition  on  a
> > block  special device, or if other parameters do not make sense.  In order to force mke2fs to
> > create a filesystem even if the filesystem appears to be in use or is mounted (a  truly  dangerous thing to do), this option must be specified twice.


> -g blocks-per-group
> > Specify  the number of blocks in a block group.  There is generally no reason for the user to
> > ever set this parameter, as the default is optimal for the filesystem.   (For  administrators
> > who  are creating filesystems on RAID arrays, it is preferable to use the stride RAID parameter as part of the -E option rather than manipulating the number of blocks per group.)   This
> > option is generally used by developers who are developing test cases.


> -G number-of-groups
> > Specify  the  number of block groups that will be packed together to create one large virtual
> > block group on an ext4 filesystem.  This improves meta-data locality and performance on meta-
> > data heavy workloads.  The number of groups must be a power of 2 and may only be specified if
> > the flex`_`bg filesystem feature is enabled.


> -i bytes-per-inode
> > Specify the bytes/inode ratio.  mke2fs creates an inode for every  bytes-per-inode  bytes  of
> > space  on  the disk.  The larger the bytes-per-inode ratio, the fewer inodes will be created.
> > This value generally shouldn't be smaller than the blocksize of the filesystem, since in that
> > case  more  inodes would be made than can ever be used.  Be warned that it is not possible to
> > expand the number of inodes on a filesystem after it is created, so be careful  deciding  the
> > correct value for this parameter.


> -I inode-size
> > Specify the size of each inode in bytes.  mke2fs creates 256-byte inodes by default.  In kernels after 2.6.10 and some earlier vendor kernels it is possible  to  utilize  inodes  larger
> > than  128  bytes to store extended attributes for improved performance.  The inode-size value
> > must be a power of 2 larger or equal to 128.  The larger the inode-size the  more  space  the
> > inode  table  will  consume, and this reduces the usable space in the filesystem and can also
> > negatively impact performance.  Extended attributes stored in large inodes  are  not  visible
> > with  older  kernels, and such filesystems will not be mountable with 2.4 kernels at all.  It
> > is not possible to change this value after the filesystem is created.


> -j     Create the filesystem with an ext3 journal.  If the -J option is not specified,  the  default
> > journal  parameters  will be used to create an appropriately sized journal (given the size of
> > the filesystem) stored within the filesystem.  Note that you must be using a kernel which has
> > ext3 support in order to actually make use of the journal.


> -J journal-options
> > Create  the  ext3  journal  using options specified on the command-line.  Journal options are
> > comma separated, and may take an argument using the equals (`=`)  sign.  The following  journal options are supported:


> size=journal-size
> > Create  an internal journal (i.e., stored inside the filesystem) of size journal-
> > size megabytes.  The size of the journal must be at least 1024 filesystem  blocks
> > (i.e.,  1MB if using 1k blocks, 4MB if using 4k blocks, etc.)  and may be no more
> > than 102,400 filesystem blocks.


> device=external-journal
> > Attach the filesystem to the journal block device  located  on  external-journal.
> > The external journal must already have been created using the command


> mke2fs -O journal`_`dev external-journal

> Note that external-journal must have been created with the same block size as the
> new filesystem.  In addition, while  there  is  support  for  attaching  multiple
> filesystems  to  a single external journal, the Linux kernel and e2fsck(8) do not
> currently support shared external journals yet.

> Instead of specifying a device name directly, external-journal can also be specified  by either LABEL=label or UUID=UUID to locate the external journal by either
> the volume label or UUID stored in the ext2 superblock at the start of the  journal.   Use  dumpe2fs(8) to display a journal device's volume label and UUID.  See
> also the -L option of tune2fs(8).

> Only one of the size or device options can be given for a filesystem.

> -l filename
> > Read the bad blocks list from filename.  Note that the block numbers in the  bad  block  list
> > must be generated using the same block size as used by mke2fs.  As a result, the -c option to
> > mke2fs is a much simpler and less error-prone method of checking a disk for bad blocks before
> > formatting it, as mke2fs will automatically pass the correct parameters to the badblocks program.


> -L new-volume-label
> > Set the volume label for the filesystem to new-volume-label.  The maximum length of the  volume label is 16 bytes.


> -m reserved-blocks-percentage
> > Specify  the  percentage  of  the filesystem blocks reserved for the super-user.  This avoids
> > fragmentation, and allows root-owned daemons, such as syslogd(8),  to  continue  to  function
> > correctly  after  non-privileged processes are prevented from writing to the filesystem.  The
> > default percentage is 5%.


> -M last-mounted-directory
> > Set the last mounted directory for the filesystem.  This might be  useful  for  the  sake  of
> > utilities that key off of the last mounted directory to determine where the filesystem should
> > be mounted.


> -n     Causes mke2fs to not actually create a filesystem, but display what it would do if it were to
> > create  a  filesystem.   This can be used to determine the location of the backup superblocks
> > for a particular filesystem, so long as the mke2fs  parameters  that  were  passed  when  the
> > filesystem was originally created are used again.  (With the -n option added, of course!)


> -N number-of-inodes
> > Overrides  the  default  calculation  of the number of inodes that should be reserved for the
> > filesystem (which is based on the number of blocks  and  the  bytes-per-inode  ratio).   This
> > allows the user to specify the number of desired inodes directly.


> -o creator-os
> > Overrides  the  default value of the "creator operating system" field of the filesystem.  The
> > creator field is set by default to the name of the OS the mke2fs executable was compiled for.


> -O feature[,...]
> > Create  a  filesystem  with  the  given features (filesystem options), overriding the default
> > filesystem options.  The features that are enabled by default are specified by the  base`-`features  relation, either in the [defaults](defaults.md) section in the /etc/mke2fs.conf configuration file,
> > or in the [fs`_`types] subsections for the usage types as specified by the -T  option,  further
> > modified  by the features relation found in the [fs`_`types] subsections for the filesystem and
> > usage types.  See the mke2fs.conf(5) manual page for more details.  The filesystem  type-specific  configuration setting found in the [fs`_`types] section will override the global default
> > found in [defaults](defaults.md).


> The filesystem feature set will be further edited using either the feature set  specified  by
> this  option,  or  if  this  option  is  not  given, by the default`_`features relation for the
> filesystem type being created, or in the [defaults](defaults.md) section of the configuration file.


> The filesystem feature set is comprised of a list of features, separated by commas, that  are
> to  be  enabled.   To  disable  a feature, simply prefix the feature name with a  caret (`^`)
> character.  The pseudo-filesystem feature "none" will clear all filesystem features.

> `large_file`
> > Filesystem can contain files that are greater than 2GB.  (Modern kernels set this
> > feature automatically when a file > 2GB is created.)


> `dir_index`
> > Use hashed b-trees to speed up lookups in large directories.


> filetype
> > Store file type information in directory entries.


> `flex_bg`
> > Allow  bitmaps  and  inode  tables for a block group to be placed anywhere on the
> > storage media (use with -G option to group meta-data in order to create  a  large
> > virtual block group).


> `has_journal`
> > Create an ext3 journal (as if using the -j option).


> `journal_dev`
> > Create  an  external  ext3  journal on the given device instead of a regular ext2
> > filesystem.  Note that external-journal must be created with the same block  size
> > as the filesystems that will be using it.


> extent Instead  of  using  the  indirect  block  scheme for storing the location of data
> > blocks in an inode, use extents instead.  This is a much more efficient  encoding
> > which speeds up filesystem access, especially for large files.


> `uninit_bg`
> > Create  a  filesystem without initializing all of the block groups.  This feature
> > also enables checksums and  highest-inode-used  statistics  in  each  blockgroup.
> > This   feature   can   speed   up   filesystem   creation   time  noticeably  (if
> > `lazy_itable_init` is enabled), and can also reduce e2fsck time  dramatically.   It
> > is only supported by the ext4 filesystem in recent Linux kernels.


> `resize_inode`
> > Reserve space so the block group descriptor table may grow in the future.  Useful
> > for online resizing using resize2fs.  By default mke2fs will attempt  to  reserve
> > enough  space  so  that  the  filesystem may grow to 1024 times its initial size.
> > This can be changed using the resize extended option.


> `sparse_super`
> > Create a filesystem with fewer superblock backup copies  (saves  space  on  large
> > filesystems).


> -q     Quiet execution.  Useful if mke2fs is run in a script.

> -r revision
> > Set the filesystem revision for the new filesystem.  Note that 1.2 kernels only support [revision 0](https://code.google.com/p/cbse-065/source/detail?r=0) filesystems.  The default is to create [revision 1](https://code.google.com/p/cbse-065/source/detail?r=1) filesystems.


> -S     Write superblock and group descriptors only.  This is useful if all  of  the  superblock  and
> > backup  superblocks  are  corrupted,  and a last-ditch recovery method is desired.  It causes
> > mke2fs to reinitialize the superblock and group descriptors, while not touching the inode table and the block and inode bitmaps.  The e2fsck program should be run immediately after this
> > option is used, and there is no guarantee that any data will be salvageable.  It is  critical
> > to  specify the correct filesystem blocksize when using this option, or there is no chance of
> > recovery.


> -t fs-type
> > Specify the filesystem type (i.e., ext2, ext3, ext4, etc.) that is to be  created.   If  this
> > option  is  not specified, mke2fs will pick a default either via how the command was run (for
> > example, using a name of the form mkfs.ext2, mkfs.ext3, etc.) or via a default as defined  by
> > the  /etc/mke2fs.conf(5)  file.    This  option controls which filesystem options are used by
> > default, based on the fstypes configuration stanza in /etc/mke2fs.conf(5).


> If the -O option is used to explicitly add or remove filesystem options that should be set in
> the  newly created filesystem, the resulting filesystem may not be supported by the requested
> fs-type.  (e.g., "mke2fs -t ext3 -O extents /dev/sdXX" will create a filesystem that  is  not
> supported  by  the  ext3  implementation as found in the Linux kernel; and "mke2fs -t ext3 -O
> `^has_journal` /dev/hdXX" will create a filesystem that does not have a journal and hence  will
> not be supported by the ext3 filesystem code in the Linux kernel.)

> -T usage-type[,...]
> > Specify  how the filesystem is going to be used, so that mke2fs can choose optimal filesystem
> > parameters for that use.  The usage types that are supported are defined in the configuration
> > file  /etc/mke2fs.conf(5).   The user may specify one or more usage types using a comma separated list.


> If this option is is not specified, mke2fs will pick a single default usage type based on the
> size  of  the  filesystem  to  be created.  If the filesystem size is less than or equal to 3
> megabytes, mke2fs will use the filesystem type floppy.  If the  filesystem  size  is  greater
> than  3  but  less  than  or equal to 512 megabytes, mke2fs(8) will use the filesystem small.
> Otherwise, mke2fs(8) will use the default filesystem type default.

> -v     Verbose execution.

> -V     Print the version number of mke2fs and exit.


### resize2fs ###

> The resize2fs program will resize ext2 or ext3 file systems.  It can be used to enlarge or shrink an
> unmounted file system located on device.  If the filesystem is mounted, it can be used to expand the
> size of the mounted filesystem, assuming the kernel supports on-line resizing.  (As of this writing,
> the Linux 2.6 kernel supports on-line resize for filesystems mounted using ext3 only.).

> The size parameter specifies the requested new size of the filesystem.  If no units  are  specified,
> the  units  of  the size parameter shall be the filesystem blocksize of the filesystem.  Optionally,
> the size parameter may be suffixed by one of the following the units designators: s, K, M,  or
> G,  for  512  byte  sectors,  kilobytes,  megabytes,  or gigabytes, respectively.  The size of the
> filesystem may never be larger than the size of the partition.  If size parameter is not  specified,
> it will default to the size of the partition.

> The resize2fs program does not manipulate the size of partitions.  If you wish to enlarge a filesystem, you must make sure you can expand the size of the underlying partition first.  This can be done
> using  fdisk(8) by deleting the partition and recreating it with a larger size or using lvextend(8),
> if you're using the logical volume manager lvm(8).  When recreating the  partition,  make  sure  you
> create it with the same starting disk cylinder as before!  Otherwise, the resize operation will certainly not work, and you may lose your entire filesystem.  After running fdisk(8), run resize2fs  to
> resize the ext2 filesystem to use all of the space in the newly enlarged partition.

> If you wish to shrink an ext2 partition, first use resize2fs to shrink the size of filesystem.  Then
> you may use fdisk(8) to shrink the size of the partition.  When shrinking the size of the partition,
> make sure you do not make it smaller than the new size of the ext2 filesystem!
> -d debug-flags
> > Turns  on  various  resize2fs debugging features, if they have been compiled into the binary.
> > debug-flags should be computed by adding the numbers of the desired features from the following list:
> > > 2    - Debug block relocations
> > > 4    - Debug inode relocations
> > > 8    - Debug moving the inode table


> -f     Forces  resize2fs  to  proceed  with  the filesystem resize operation, overriding some safety
> > checks which resize2fs normally enforces.


> -F     Flush the filesystem device's buffer caches before beginning.  Only really useful  for  doing
> > resize2fs time trials.


> -M     Shrink the filesystem to the minimum size.

> -p     Prints  out  a  percentage completion bars for each resize2fs operation, so that the user can
> > keep track of what the program is doing.


> -P     Print the minimum size of the filesystem and exit.

> -S RAID-stride
> > The resize2fs program will heuristically determine the RAID stride that  was  specified  when
> > the  filesystem was created.  This option allows the user to explicitly specify a RAID stride
> > setting to be used by resize2fs instead.

KNOWN BUGS

> The minimum size of the filesystem as estimated  by  resize2fs  may  be  incorrect,  especially  for
> filesystems with 1k and 2k blocksizes.

### tune2fs ###

> tune2fs  allows  the  system  administrator to adjust various tunable filesystem parameters on Linux
> > ext2/ext3 filesystems.


> -c max-mount-counts
> > Adjust the number of mounts after which the filesystem will be checked by e2fsck(8).  If max-
> > mount-counts is 0 or -1, the number of times the filesystem is mounted will be disregarded by
> > e2fsck(8) and the kernel.


> Staggering the mount-counts at which filesystems are forcibly checked will avoid all filesystems being checked at one time when using journaled filesystems.

> You  should  strongly  consider  the consequences of disabling mount-count-dependent checking
> entirely.  Bad disk drives, cables, memory, and kernel bugs could all  corrupt  a  filesystem
> without  marking  the  filesystem  dirty  or  in  error.  If you are using journaling on your
> filesystem, your filesystem will never be marked dirty, so it will not normally  be  checked.
> A filesystem error detected by the kernel will still force an fsck on the next reboot, but it
> may already be too late to prevent data loss at that point.

> See also the -i option for time-dependent checking.

> -C mount-count
> > Set the number of times the filesystem has been mounted.  If set to a greater value than  the
> > max-mount-counts  parameter  set by the -c option, e2fsck(8) will check the filesystem at the
> > next reboot.


> -e error-behavior
> > Change the behavior of the kernel code when errors are detected.  In all cases, a  filesystem
> > error  will  cause e2fsck(8) to check the filesystem on the next boot.  error-behavior can be
> > one of the following:


> continue    Continue normal execution.

> remount-ro  Remount filesystem read-only.

> panic       Cause a kernel panic.

> -E extended-options
> > Set extended options for the filesystem.  Extended options are comma separated, and may  take
> > an argument using the equals (=) sign.  The following extended options are supported:


> stride=stride-size
> > Configure  the  filesystem  for  a RAID array with stride-size filesystem blocks.
> > This is the number of blocks read or written to disk before moving to next  disk.
> > This  mostly  affects  placement of filesystem metadata like bitmaps at mke2fs(2)
> > time to avoid placing them on a single disk, which can hurt the performance.   It
> > may also be used by block allocator.


> `stripe_width=stripe-width`
> > Configure the filesystem for a RAID array with stripe-width filesystem blocks per
> > stripe. This is typically be stride-size `*` N, where N is the number of data disks
> > in  the  RAID  (e.g. RAID 5 N+1, RAID 6 N+2).  This allows the block allocator to
> > prevent read-modify-write of the parity in a RAID stripe  if  possible  when  the
> > data is written.


> `hash_alg=hash-alg`
> > Set  the  default hash algorithm used for filesystems with hashed b-tree directories.  Valid algorithms accepted are: legacy, `half_md4`, and tea.


> `test_fs`
> > Set a flag in the filesystem superblock indicating that it may be  mounted  using
> > experimental kernel code, such as the ext4dev filesystem.


> `^test_fs`
> > Clear  the  `test_fs`  flag, indicating the filesystem should only be mounted using
> > production-level filesystem code.


> -f     Force the tune2fs operation to complete even in the face of errors.  This  option  is  useful
> > when  removing  the  `has_journal`  filesystem  feature from a filesystem which has an external
> > journal (or is corrupted such that it appears to have an external journal), but that external
> > journal is not available.


> WARNING: Removing an external journal from a filesystem which was not cleanly unmounted without first replaying the external journal can result in severe data loss and  filesystem  corruption.

> -g group
> > Set  the  group  which  can use the reserved filesystem blocks.  The group parameter can be a
> > numerical gid or a group name.  If a group name is given, it is converted to a numerical  gid
> > before it is stored in the superblock.


> -i  interval-between-checks[d|m|w]
> > Adjust  the maximal time between two filesystem checks.  No postfix or d result in days, m in
> > months, and w in weeks.  A value of zero will disable the time-dependent checking.


> It is strongly recommended that either  -c  (mount-count-dependent)  or  -i  (time-dependent)
> checking  be enabled to force periodic full e2fsck(8) checking of the filesystem.  Failure to
> do so may lead to filesystem corruption (due to bad disks, cables, memory,  or  kernel  bugs)
> going unnoticed, ultimately resulting in data loss or corruption.

> -j     Add  an ext3 journal to the filesystem.  If the -J option is not specified, the default journal parameters will be used to create an appropriately sized journal (given the size  of  the
> > filesystem)  stored  within  the  filesystem.  Note that you must be using a kernel which has
> > ext3 support in order to actually make use of the journal.


> If this option is used to create a journal on a mounted filesystem, an immutable file, .journal, will be created in the top-level directory of the filesystem, as it is the only safe way
> to create the journal inode while the filesystem is mounted.  While the ext3 journal is visible, it is not safe to delete it, or modify it while the filesystem is mounted; for this reason the file is marked immutable.  While checking unmounted filesystems, e2fsck(8) will automatically  move .journal files to the invisible, reserved journal inode.  For all filesystems
> except for the root filesystem,  this should happen automatically and  naturally  during  the
> next  reboot  cycle.   Since  the root filesystem is mounted read-only, e2fsck(8) must be run
> from a rescue floppy in order to effect this transition.

> On some distributions, such as Debian, if an initial ramdisk is used, the initrd scripts will
> automatically  convert  an  ext2 root filesystem to ext3 if the /etc/fstab file specifies the
> ext3 filesystem for the root filesystem in order to avoid  requiring  the  use  of  a  rescue
> floppy to add an ext3 journal to the root filesystem.

> -J journal-options
> > Override  the  default  ext3 journal parameters. Journal options are comma separated, and may
> > take an argument using the equals (=)  sign.  The following journal options are supported:


> size=journal-size
> > Create a journal stored in the filesystem of size journal-size  megabytes.    The
> > size  of  the journal must be at least 1024 filesystem blocks (i.e., 1MB if using
    1. blocks, 4MB if using 4k blocks,  etc.)   and  may  be  no  more  than  102,400
> > filesystem blocks.  There must be enough free space in the filesystem to create a
> > journal of that size.


> device=external-journal
> > Attach the filesystem to the journal block device  located  on  external-journal.
> > The external journal must have been already created using the command


> mke2fs -O `journal_dev` external-journal

> Note that external-journal must be formatted with the same block size as filesystems which will be using it.  In addition, while there is support  for  attaching
> multiple filesystems to a single external journal, the Linux kernel and e2fsck(8)
> do not currently support shared external journals yet.

> Instead of specifying a device name directly, external-journal can also be specified  by either LABEL=label or UUID=UUID to locate the external journal by either
> the volume label or UUID stored in the ext2 superblock at the start of the  journal.   Use  dumpe2fs(8) to display a journal device's volume label and UUID.  See
> also the -L option of tune2fs(8).

> Only one of the size or device options can be given for a filesystem.

> -l     List the contents of the filesystem superblock.

> -L volume-label
> > Set the volume label of the filesystem.  Ext2 filesystem labels can be at most 16  characters
> > long;  if  volume-label  is  longer  than 16 characters, tune2fs will truncate it and print a
> > warning.  The volume label can be used by mount(8), fsck(8), and /etc/fstab(5) (and  possibly
> > others)  by  specifying  LABEL=`volume_label`  instead  of  a  block  special  device name like
> > /dev/hda5.


> -m reserved-blocks-percentage
> > Set the percentage of the filesystem which may only be  allocated  by  privileged  processes.
> > Reserving  some  number of filesystem blocks for use by privileged processes is done to avoid
> > filesystem fragmentation, and to allow system daemons, such as  syslogd(8),  to  continue  to
> > function  correctly after non-privileged processes are prevented from writing to the filesystem.  Normally, the default percentage of reserved blocks is 5%.


> -M last-mounted-directory
> > Set the last-mounted directory for the filesystem.


> -o [^]mount-option[,...]
> > Set or clear the indicated default mount options in the filesystem.   Default  mount  options
> > can  be  overridden by mount options specified either in /etc/fstab(5) or on the command line
> > arguments to mount(8).  Older kernels may not support this feature;  in  particular,  kernels
> > which  predate  2.4.20  will  almost  certainly ignore the default mount options field in the
> > superblock.


> More than one mount option can be cleared or set by separating features with  commas.   Mount
> options prefixed with a caret character (^) will be cleared in the filesystem's superblock;
> mount options without a prefix character or prefixed with a  plus  character  (+)  will  be
> added to the filesystem.

> The following mount options can be set or cleared using tune2fs:

> debug  Enable debugging code for this filesystem.

> bsdgroups
> > Emulate BSD behaviour when creating new files: they will take the group-id of the
> > directory in which they were created.  The standard System  V  behaviour  is  the
> > default,  where  newly  created  files  take on the fsgid of the current process,
> > unless the directory has the setgid bit set, in which case it takes the gid  from
> > the  parent  directory,  and  also  gets  the setgid bit set if it is a directory
> > itself.


> `user_xattr`
> > Enable user-specified extended attributes.


> acl    Enable Posix Access Control Lists.

> uid16  Disables 32-bit UIDs and GIDs.  This is for interoperability with  older  kernels
> > which only store and expect 16-bit values.


> `journal_data`
> > When the filesystem is mounted with journalling enabled, all data (not just metadata) is committed into the journal prior to being written into the main filesystem.


> `journal_data_ordered`
> > When  the  filesystem  is  mounted  with  journalling enabled, all data is forced
> > directly out to the main file system prior to its metadata being committed to the
> > journal.


> `journal_data_writeback`
> > When the filesystem is mounted with journalling enabled, data may be written into
> > the main filesystem after its metadata has been committed to the  journal.   This
> > may  increase throughput, however, it may allow old data to appear in files after
> > a crash and journal recovery.


> -O [^]feature[,...]
> > Set or clear the indicated filesystem features (options) in the filesystem.   More  than  one
> > filesystem feature can be cleared or set by separating features with commas.  Filesystem features prefixed with a caret character (^) will be cleared in the  filesystem's  superblock;
> > filesystem  features  without a prefix character or prefixed with a plus character (+) will
> > be added to the filesystem.


> The following filesystem features can be set or cleared using tune2fs:

> `large_file`
> > Filesystem can contain files that are greater than 2GB.  (Modern kernels set this
> > feature automatically when a file > 2GB is created.)


> `dir_index`
> > Use hashed b-trees to speed up lookups in large directories.


> filetype
> > Store file type information in directory entries.


> `has_journal`
> > Use  a  journal  to  ensure filesystem consistency even across unclean shutdowns.
> > Setting the filesystem feature is equivalent to using the -j option.


> `sparse_super`
> > Limit the number of backup superblocks to save space on large filesystems.


> `resize_inode`
> > Reserve space so the block  group  descriptor  table  may  grow  in  the  future.
> > Tune2fs only supports clearing this filesystem feature.


> `uninit_bg`
> > Allow the kernel to initialize bitmaps and inode tables and keep a high watermark
> > for the unused inodes in a filesystem, to  reduce  e2fsck(8)  time.   This  first
> > e2fsck  run  after  enabling this feature will take the full time, but subsequent
> > e2fsck runs will take only a fraction of the original time, depending on how full
> > the file system is.


> After  setting or clearing `sparse_super, uninit_bg`, filetype, or `resize_inode` filesystem features, e2fsck(8) must be run on the filesystem to  return  the  filesystem  to  a  consistent
> state.   Tune2fs  will print a message requesting that the system administrator run e2fsck(8)
> if necessary.  After setting the `dir_index` feature, e2fsck -D can be run to convert  existing
> directories  to  the  hashed B-tree format.  Enabling certain filesystem features may prevent
> the filesystem from being mounted by kernels which do not support those features.  In particular the `uninit_bg and flex_bg` features are only supported by the ext4 filesystem.

> -r reserved-blocks-count
> > Set the number of reserved filesystem blocks.


> -T time-last-checked
> > Set the time the filesystem was last checked using e2fsck.  The time is interpreted using the
> > current (local) timezone.  This can be useful in scripts which use a Logical  Volume  Manager
> > to make a consistent snapshot of a filesystem, and then check the filesystem during off hours
> > to make sure it hasn't been corrupted due to hardware problems, etc.  If the  filesystem  was
> > clean,  then this option can be used to set the last checked time on the original filesystem.
> > The format of time-last-checked is the international date format, with an optional time specifier, i.e.  YYYYMMDD[HH[MM[SS](SS.md)]].   The keyword now is also accepted, in which case the last
> > checked time will be set to the current time.


> -u user
> > Set the user who can use the reserved filesystem blocks.  user can be a numerical  uid  or  a
> > user  name.   If a user name is given, it is converted to a numerical uid before it is stored
> > in the superblock.


> -U UUID
> > Set the universally unique identifier (UUID) of the filesystem to UUID.  The  format  of  the
> > UUID    is    a    series    of    hex    digits    separated    by   hyphens,   like   this:
> > "c1b9d5a2-f162-11cf-9ece-0020afc76f16".  The UUID parameter may also be one of the following:


> clear  clear the filesystem UUID

> random generate a new randomly-generated UUID

> time   generate a new time-based UUID

> The  UUID may be used by mount(8), fsck(8), and /etc/fstab(5) (and possibly others) by specifying UUID=uuid instead of a block special device name like /dev/hda1.

> See uuidgen(8) for more information.  If the system does not have a good random number generator  such  as  /dev/random or /dev/urandom, tune2fs will automatically use a time-based UUID
> instead of a randomly-generated UUID.


### debugfs ###

> The debugfs program is an interactive file system debugger. It can be used to examine and change the
> state of an ext2 file system.
> device  is  the  special  file  corresponding  to  the  device  containing the ext2 file system (e.g
> /dev/hdXX).

> -w     Specifies that the file system should be opened in read-write mode.  Without this option, the
> > file system is opened in read-only mode.


> -c     Specifies  that the file system should be opened in catastrophic mode, in which the inode and
> > group bitmaps are not read initially.  This can be useful for  filesystems  with  significant
> > corruption,  but  because of this, catastrophic mode forces the filesystem to be opened read-
> > only.


> -i     Specifies that device represents an ext2 image file created by the  e2image  program.   Since
> > the  ext2  image  file  only contains the superblock, block group descriptor, block and inode
> > allocation bitmaps, and the inode table, many debugfs commands will  not  function  properly.
> > Warning:  no safety checks are in place, and debugfs may fail in interesting ways if commands
> > such as ls, dump, etc. are tried without  specifying  the  `data_source_device`  using  the  -d
> > option.  debugfs is a debugging tool.  It has rough edges!


> -d data\_source\_device
> > Used with the -i option, specifies that data\_source\_device should be used when reading blocks
> > not found in the ext2 image file.  This includes data, directory, and indirect blocks.


> -b blocksize
> > Forces the use of the given block size for the file system, rather than detecting the correct
> > block size as normal.


> -s superblock
> > Causes  the  file  system superblock to be read from the given block number, instead of using
> > the primary superblock (located at an offset of 1024 bytes from the beginning of the filesystem).   If  you  specify the -s option, you must also provide the blocksize of the filesystem
> > via the -b option.


> -f cmd\_file
> > Causes debugfs to read in commands from cmd\_file, and execute them.  When debugfs is finished
> > executing those commands, it will exit.


> -R request
> > Causes debugfs to execute the single command request, and then exit.


> -V     print the version number of debugfs and exit.

SPECIFYING FILES
> Many  debugfs commands take a filespec as an argument to specify an inode (as opposed to a pathname)
> in the filesystem which is currently opened by debugfs.  The filespec argument may be  specified  in
> two  forms.   The first form is an inode number surrounded by angle brackets, e.g., `<2>`.  The second
> form is a pathname; if the pathname is prefixed by a forward slash (/),  then  it  is  interpreted
> relative  to  the root of the filesystem which is currently opened by debugfs.  If not, the pathname
> is interpreted relative to the current working directory as maintained by debugfs.  This may be modified by using the debugfs command cd.

COMMANDS
> This is a list of the commands which debugfs supports.

> bmap filespec `logical_block`
> > Print  the  physical  block number corresponding to the logical block number `logical_block` in
> > the inode filespec.


> cat filespec
> > Dump the contents of the inode filespec to stdout.


> cd filespec
> > Change the current working directory to filespec.


> chroot filespec
> > Change the root directory to be the directory filespec.


> close  Close the currently open file system.


> icheck block
> > Print a listing of the inodes which use the one or more blocks specified on the command line.


> imap filespec
> > Print the location of the inode data structure (in the inode table) of the inode filespec.


> `init_filesys device blocksize`
> > Create an ext2 file system on device with device size blocksize.  Note  that  this  does  not
> > fully  initialize all of the data structures; to do this, use the mke2fs(8) program.  This is
> > just a call to the low-level library, which sets up the superblock and block descriptors.


> `kill_file filespec`
> > Deallocate the inode filespec and its blocks.  Note that this does not remove  any  directory
> > entries (if any) to this inode.  See the rm(1) command if you wish to unlink a file.


> lcd directory
> > Change  the  current  working  directory  of  the  debugfs process to directory on the native
> > filesystem.


> ln filespec dest\_file
> > Create a link named dest\_file which is a link to filespec.  Note this  does  not  adjust  the
> > inode reference counts.


> logdump [-acs] [-b

&lt;block&gt;

] [-i

&lt;filespec&gt;

] [-f

<journal\_file>

] [output\_file](output_file.md)
> > Dump  the  contents  of  the ext3 journal.  By default, the journal inode as specified in the
> > superblock.  However, this can be overridden with the -i option, which uses an  inode  specifier  to  specify  the  journal  to be used.  A file containing journal data can be specified
> > using the -f option.   Finally,  the  -s  option  utilizes  the  backup  information  in  the
> > superblock to locate the journal.


> The  -a  option  causes  the  logdump  program to print the contents of all of the descriptor
> > blocks.  The -b option causes logdump to print all journal records  that  are  refer  to  the
> > specified  block.   The  -c  option  will  print  out  the contents of all of the data blocks
> > selected by the -a and -b options.


> ls [-l] [-d] [-p] filespec
> > Print a listing of the files in the directory filespec.  The -l flag will list files using  a
> > more  verbose  format.   The -d flag will list deleted entries in the directory.  The -p flag
> > will list the files in a format which is more easily parsable by scripts, as well  as  making
> > it more clear when there are spaces or other non-printing characters at the end of filenames.


> `modify_inode` filespec
> > Modify the contents of the inode structure in the inode filespec.


> mkdir filespec
> > Make a directory.


> mknod filespec [p|[[c|b] major minor]]
> > Create a special device file (a named pipe, character or block device).  If  a  character  or
> > block device is to be made, the major and minor device numbers must be specified.


> ncheck `inode_num ...`
> > Take the requested list of inode numbers, and print a listing of pathnames to those inodes.


> open [-w] [-e] [-f] [-i] [-c] [-b blocksize] [-s superblock] device
> > Open  a filesystem for editing.  The -f flag forces the filesystem to be opened even if there
> > are some unknown or  incompatible  filesystem  features  which  would  normally  prevent  the
> > filesystem  from  being  opened.  The -e flag causes the filesystem to be opened in exclusive
> > mode.  The -b, -c, -i, -s, and -w options behave the same  as  the  command-line  options  to
> > debugfs.


> pwd    Print the current working directory.
> quit   Quit debugfs

> rdump directory destination
> > Recursively dump directory and all its contents (including regular files, symbolic links, and
> > other directories) into the named destination which should be an existing  directory  on  the
> > native filesystem.


> rm pathname
> > Unlink  pathname.   If  this  causes the inode pointed to by pathname to have no other references, deallocate the file.  This command functions as the unlink() system call.


> rmdir filespec
> > Remove the directory filespec.


> setb block [count](count.md)
> > Mark the block number block as allocated.  If the optional argument count  is  present,  then
> > count blocks starting at block number block will be marked as allocated.


> `set_block_group` bgnum field value
> > Modify the block group descriptor specified by bgnum so that the block group descriptor field
> > field has value value.


> seti filespec
> > Mark inode filespec as in use in the inode bitmap.


> `set_inode_field` filespec field value
> > Modify the inode specified by filespec so that the inode field field has  value  value.   The
> > list  of  valid  inode fields which can be set via this command can be displayed by using the
> > command: `set_inode_field` -l


> `set_super_value field` value
> > Set the superblock field field to value.  The list of valid superblock fields  which  can  be
> > set via this command can be displayed by using the command: `set_super_value` -l


> `show_super_stats` [-h]
> > List  the  contents  of  the  super block and the block group descriptors.  If the -h flag is
> > given, only print out the superblock contents.


> stat filespec
> > Display the contents of the inode structure of the inode filespec.


> testb block [count](count.md)
> > Test if the block number block is marked as allocated in the block bitmap.  If  the  optional
> > argument count is present, then count blocks starting at block number block will be tested.


> testi filespec
> > Test if the inode filespec is marked as allocated in the inode bitmap.


> undel '<inode num>' [pathname](pathname.md)
> > Undelete  the  specified inode number (which must be surrounded by angle brackets) so that it
> > and its blocks are marked in use, and optionally link the recovered inode  to  the  specified
> > pathname.   The  e2fsck command should always be run after using the undel command to recover
> > deleted files.


> Note that if you are recovering a large number of deleted  files,  linking  the  inode  to  a
> directory  may  require  the  directory to be expanded, which could allocate a block that had
> been used by one of the yet-to-be-undeleted files.  So it is safer to  undelete  all  of  the
> inodes  without  specifying  a  destination  pathname,  and  then in a separate pass, use the
> debugfs link command to link the inode to the destination pathname, or use  e2fsck  to  check
> the filesystem and link all of the recovered inodes to the lost+found directory.

> unlink pathname
> > Remove  the link specified by pathname to an inode.  Note this does not adjust the inode reference counts.


> `write source_file out_file`
> > Create a file in the filesystem named `out_file`, and copy the contents of `source_file` into the
> > destination file.

ENVIRONMENT VARIABLES

> `DEBUGFS_PAGER`, PAGER
> > The  debugfs(8) program always pipes the output of the some commands through a pager program.
> > These    commands     include:     `show_super_stats,     list_directory,     show_inode_info`,
> > list\_deleted\_inodes,  and  htree\_dump`.   The  specific  pager can explicitly specified by the
> > `DEBUGFS\_PAGER environment variable, and if it is not set, by the PAGER environment  variable.


> Note  that  since  a pager is always used, the less(1) pager is not particularly appropriate,
> since it clears the screen before displaying the output of the command and clears the  output
> the  screen  when  the  pager is exited.  Many users prefer to use the less(1) pager for most
> purposes, which is why the `DEBUGFS_PAGER` environment variable is available  to  override  the
> more general PAGER environment variable.


### e2undo ###

> e2undo will replay the undo log undo\_log for an ext2/ext3/ext4 filesystem found on device.  This can
> > be used to undo a failed operation by an e2fsprogs program.


> -f     Normally, e2undo will check the filesystem UUID and last modified time to make sure the  undo
> > log  matches  with the filesystem on the device.  If they do not match, e2undo will refuse to
> > apply the undo log as a safety mechanism.  The -f option disables this safety mechanism.


### findfs ###


> findfs will search the disks in the system looking for a filesystem which has a label matching label
> > or a UUID equal to uuid.  If the filesystem is found, the device name for  the  filesystem  will  be
> > printed on stdout.


### chattr ###


> chattr changes the file attributes on a Linux second extended file system.

> The format of a symbolic mode is +-=[ASacDdIijsTtu](ASacDdIijsTtu.md).

> The operator + causes the selected attributes to be added to the existing attributes of the files;
> - causes them to be removed; and = causes them to be the only attributes that the files have.

> The letters acdijsuADST select the new attributes for the files: append only (a), compressed  (c),
> no  dump  (d),  immutable  (i),  data  journalling  (j),  secure  deletion (s), no tail-merging (t),
> undeletable (u), no atime updates (A), synchronous directory updates (D), synchronous  updates  (S),
> and top of directory hierarchy (T).

> -R     Recursively change attributes of directories and their contents.

> -V     Be verbose with chattr's output and print the program version.

> -f     Suppress most error messages.

> -v version
> > Set the file's version/generation number.

ATTRIBUTES

> When a file with the A attribute set is accessed, its atime record is not modified.  This avoids a
> certain amount of disk I/O for laptop systems.

> A file with the a attribute set can only be open in append mode for writing.  Only  the  superuser
> or a process possessing the `CAP_LINUX_IMMUTABLE` capability can set or clear this attribute.

> A  file  with  the  c attribute set is automatically compressed on the disk by the kernel.  A read
> from this file returns uncompressed data.  A write to this file compresses data before storing  them
> on  the  disk.   Note:  please make sure to read the bugs and limitations section at the end of this
> document.

> When a directory with the D attribute set is modified, the changes are  written  synchronously  on
> the disk; this is equivalent to the dirsync mount option applied to a subset of the files.

> A file with the d attribute set is not candidate for backup when the dump(8) program is run.

> The E attribute is used by the experimental compression patches to indicate that a compressed file
> has a compression error.  It may not be set or reset using chattr(1), although it can  be  displayed
> by lsattr(1).

> The  e  attribute indicates that the file is using extents for mapping the blocks on disk.  It may
> not be set or reset using chattr(1), although it can be displayed by lsattr(1).

> The I attribute is used by the htree code to indicate that a  directory  is  being  indexed  using
> hashed  trees.   It  may  not  be  set  or  reset  using  chattr(1), although it can be displayed by
> lsattr(1).

> The H attribute indicates the file is storing its blocks in  units  of  the  filesystem  blocksize
> instead of in units of sectors, and means that the file is (or at one time was) larger than 2TB.  It
> may not be set or reset using chattr(1), although it can be displayed by lsattr(1).

> A file with the i attribute cannot be modified: it cannot be deleted or renamed, no  link  can  be
> created  to  this file and no data can be written to the file.  Only the superuser or a process possessing the CAP\_LINUX\_IMMUTABLE capability can set or clear this attribute.

> A file with the j attribute has all of its data written to the ext3 journal before  being  written
> to  the  file  itself,  if  the  filesystem  is  mounted with the "data=ordered" or "data=writeback"
> options.  When the filesystem is mounted with the "data=journal" option all  file  data  is  already
> journalled  and  this  attribute  has  no  effect.   Only  the superuser or a process possessing the
> `CAP_SYS_RESOURCE` capability can set or clear this attribute.

> When a file with the s attribute set is deleted, its blocks are zeroed and  written  back  to  the
> disk.   Note: please make sure to read the bugs and limitations section at the end of this document.

> When a file with the S attribute set is modified, the changes are  written  synchronously  on  the
> disk; this is equivalent to the sync mount option applied to a subset of the files.

> A  directory  with  the  T attribute will be deemed to be the top of directory hierarchies for the
> purposes of the Orlov block allocator (which is used in on systems with Linux 2.5.46 or later).

> A file with the t attribute will not have a partial block fragment at the end of the  file  merged
> with other files (for those filesystems which support tail-merging).  This is necessary for applications such as LILO which read the filesystem directly, and which don't understand tail-merged files.
> Note:  As  of  this  writing,  the ext2 or ext3 filesystems do not (yet, except in very experimental
> patches) support tail-merging.

> When a file with the u attribute set is deleted, its contents are saved.  This allows the user  to
> ask  for its undeletion.  Note: please make sure to read the bugs and limitations section at the end
> of this document.

> The X attribute is used by the experimental compression patches to indicate that a raw contents of
> a  compressed  file can be accessed directly.  It currently may not be set or reset using chattr(1),
> although it can be displayed by lsattr(1).

> The Z attribute is used by the experimental compression patches to indicate a compressed  file  is
> dirty.  It may not be set or reset using chattr(1), although it can be displayed by lsattr(1).

BUGS AND LIMITATIONS
> The c, s,  and u attributes are not honored by the ext2 and ext3 filesystems as implemented in
> the current mainline Linux kernels.    These attributes may be implemented in future versions of the
> ext2 and ext3 filesystems.

> The j option is only useful if the filesystem is mounted as ext3.

> The D option is only useful on Linux kernel 2.5.19 and later.


### lsattr ###

> lsattr  lists the file attributes on a second extended file system.  See chattr(1) for a description
> > of the attributes and what they mean.


> -R     Recursively list attributes of directories and their contents.

> -V     Display the program version.

> -a     List all files in directories, including files that start with '.".

> -d     List directories like other files, rather than listing their contents.

> -v     List the file's version/generation number.


### filefrag ###
> filefrag  reports on how badly fragmented a particular file might be.  It makes allowances for indirect blocks for ext2 and ext3 filesystems, but can be used on files for any filesystem.

> -v     Be verbose when checking for file fragmentation.


### mklost+found ###

> mklost+found  is  used  to create a lost+found directory in the current working directory on a Linux
> second extended file system.  There is normally a lost+found directory in the root directory of each
> filesystem.

> mklost+found  pre-allocates  disk blocks to the lost+found directory so that when e2fsck(8) is being
> run to recover a filesystem, it does not need to allocate blocks in the filesystem to store a  large
> number  of  unlinked  files.   This ensures that e2fsck will not have to allocate data blocks in the
> filesystem during recovery.

This utility has no options


## dosfstools ##

utilities for making and checking MS-DOS FAT filesystems
> The dosfstools package includes the mkdosfs (aka mkfs.dos and mkfs.vfat) and
> dosfsck (aka fsck.msdos and fsck.vfat) utilities, which respectively make and
> check MS-DOS FAT filesystems on hard drives or on floppies.
> .
> This version uses the enhanced boot sector/superblock format of DOS 3.3+ as
> well as provides a default dummy boot sector code.

### mkdosfs ###

> mkdosfs is used to create an MS-DOS file system under Linux on a device (usually a disk  partition).
> > device  is  the special file corresponding to the device (e.g /dev/hdXX).  block-count is the number
> > of blocks on the device.  If omitted, mkdosfs automatically determines the file system size.


> -A     Use Atari variation of the MS-DOS file system. This is default if mkdosfs is run on an Atari,
> > then  this option turns off Atari format. There are some differences when using Atari format:
> > If not directed otherwise by the user, mkdosfs will always use 2 sectors per  cluster,  since
> > GEMDOS  doesn't like other values very much.  It will also obey the maximum number of sectors
> > GEMDOS can handle.  Larger file systems are managed  by  raising  the  logical  sector  size.
> > Under Atari format, an Atari-compatible serial number for the file system is generated, and a
    1. bit FAT is used only for file systems that have one of the usual floppy sizes (720k, 1.2M,
    1. 44M,  2.88M),  a  16 bit FAT otherwise. This can be overridden with the -F option. Some PC-
> > specific boot sector fields aren't written, and a boot message (option -m) is ignored.


> -b sector-of-backup
> > Selects the location of the backup boot sector  for  FAT32.  Default  depends  on  number  of
> > reserved  sectors,  but  usually is sector 6. The backup must be within the range of reserved
> > sectors.


> -c     Check the device for bad blocks before creating the file system.

> -C     Create the file given as device on the command line, and write the to-be-created file  system
> > to  it. This can be used to create the new file system in a file instead of on a real device,
> > and to avoid using dd in advance to create a file of appropriate size. With this option,  the
> > block-count must be given, because otherwise the intended size of the file system wouldn't be
> > known. The file created is a sparse file, which actually only contains  the  meta-data  areas
> > (boot  sector,  FATs, and root directory). The data portions won't be stored on the disk, but
> > the file nevertheless will have the correct size. The resulting file can be copied later to a
> > floppy disk or other device, or mounted through a loop device.


> -f number-of-FATs
> > Specify  the  number  of  file allocation tables in the file system.  The default is 2.  Currently the Linux MS-DOS file system does not support more than 2 FATs.


> -F FAT-size
> > Specifies the type of file allocation tables used (12, 16 or 32 bit).  If nothing  is  specified,  mkdosfs  will automatically select between 12, 16 and 32 bit, whatever fits better for
> > the file system size.


> -h number-of-hidden-sectors
> > Select the number of hidden sectors in the volume. Apparently some digital cameras get  indigestion  if  you  feed  them a CF card without such hidden sectors, this option allows you to
> > satisfy them. Assumes ´0´ if no value is given on the command line.


> -i  volume-id
> > Sets the volume ID of the newly created file system; volume-id is a 32-bit hexadecimal number
> > (for  example,  2e24ec82).  The default is a number which depends on the file system creation
> > time.


> -I     It is typical for fixed disk devices to be partitioned so, by default, you are not  permitted
> > to  create a filesystem across the entire device.  mkdosfs will complain and tell you that it
> > refuses to work.  This is different when using MO disks.  One doesn't always need  partitions
> > on  MO  disks.   The file system can go directly to the whole disk.  Under other OSes this is
> > known as the superfloppy format.


> This switch will force mkdosfs to work properly.

> -l filename
> > Read the bad blocks list from filename.


> -m message-file
> > Sets the message the user receives on attempts to boot this file system without having  properly  installed  an  operating  system.  The message file must not exceed 418 bytes once line
> > feeds have been converted to carriage return-line  feed  combinations,  and  tabs  have  been
> > expanded.  If the filename is a hyphen (-), the text is taken from standard input.


> -n volume-name
> > Sets  the volume name (label) of the file system.  The volume name can be up to 11 characters
> > long.  The default is no label.


> -r root-dir-entries
> > Select the number of entries available in the root directory.  The default is 112 or 224  for
> > floppies and 512 for hard disks.


> -R number-of-reserved-sectors
> > Select  the  number  of  reserved  sectors. With FAT32 format at least 2 reserved sectors are
> > needed, the default is 32. Otherwise the default is 1 (only the boot sector).


> -s sectors-per-cluster
> > Specify the number of disk sectors per cluster.  Must be a power of 2, i.e. 1, 2, 4,  8,  ...
    1. 8.


> -S logical-sector-size
> > Specify  the  number  of  bytes per logical sector.  Must be a power of 2 and greater than or
> > equal to 512, i.e. 512, 1024, 2048, 4096, 8192, 16384, or 32768.


> -v     Verbose execution.

BUGS
> mkdosfs can not create boot-able file systems.

### dosfslabel ###

> dosfslabel  set  or  gets  a MS-DOS filesystem label from a given device.  If label is omitted, then
> > the label name of the specified device is written on the standard output.


> label can't be longer than 11 characters.

> -h,--help
> > Displays a help message.


> -V,--version
> > Shows version.


### dosfsck ###


> dosfsck  verifies  the  consistency  of MS-DOS file systems and optionally tries to repair them. The
> > following file system problems can be corrected (in this order):


> -      FAT contains invalid cluster numbers. Cluster is changed to EOF.
> -      File's cluster chain contains a loop. The loop is broken.
> -      Bad clusters (read errors). The clusters are marked bad and they are removed from files  owning them. This check is optional.
> -      Directories  with  a  large  number  of  bad entries (probably corrupt). The directory can be
> > deleted.

> -      Files . and .. are non-directories. They can be deleted or renamed.
> -      Directories . and .. in root directory. They are deleted.
> -      Bad file names. They can be renamed.
> -      Duplicate directory entries. They can be deleted or renamed.
> -      Directories with non-zero size field. Size is set to zero.
> -      Directory . does not point to parent directory. The start pointer is adjusted.
> -      Directory .. does not point to parent of parent directory. The start pointer is adjusted.
> -      Start cluster number of a file is invalid. The file is truncated.
> -      File contains bad or free clusters. The file is truncated.
> -      File's cluster chain is longer than indicated by the size fields. The file is truncated.
> -      Two or more files share the same cluster(s). All but one of the files are truncated.  If  the
> -       file being truncated is a directory file that has already been read, the file system check is
> > restarted after truncation.

> -      File's cluster chain is shorter than indicated by the size fields. The file is truncated.
> -      Clusters are marked as used but are not owned by a file. They are marked as free.

> Additionally, the following problems are detected, but not repaired:

> -      Invalid parameters in boot sector.
> -      Absence of . and .. entries in non-root directories

> When dosfsck checks a file system, it accumulates all changes in memory and performs them only after
> all checks are complete. This can be disabled with the -w option.

> -a     Automatically  repair  the file system. No user intervention is necessary.  Whenever there is
> > more than one method to solve a problem, the least destructive approach is used.


> -A     Use Atari variation of the MS-DOS filesystem. This is default if dosfsck is run on an  Atari,
> > then  this  option  turns off Atari format. There are some minor differences in Atari format:
> > Some boot sector fields are interpreted slightly different, and the special FAT  entries  for
> > end-of-file  and  bad cluster can be different. Under MS-DOS 0xfff8 is used for EOF and Atari
> > employs 0xffff by default, but both systems recognize all values from 0xfff8...0xffff as end-
> > of-file.  MS-DOS uses only 0xfff7 for bad clusters, where on Atari values 0xfff0...0xfff7 are
> > for this purpose (but the standard value is still 0xfff7).


> -d     Delete the specified file. If more that one file with that name  exists,  the  first  one  is
> > deleted.


> -f     Salvage  unused  cluster  chains  to files. By default, unused clusters are added to the free
> > disk space except in auto mode (-a).


> -l     List path names of files being processed.

> -n     No-operation mode: non-interactively check for  errors,  but  don't  write  anything  to  the
> > filesystem.


> -r     Interactively  repair  the  file  system. The user is asked for advice whenever there is more
> > than one approach to fix an inconsistency.


> -t     Mark unreadable clusters as bad.

> -u     Try to undelete the specified file. dosfsck tries to allocate a chain of  contiguous  unallocated clusters beginning with the start cluster of the undeleted file.

> -v     Verbose mode. Generates slightly more output.

> -V     Perform  a verification pass. The file system check is repeated after the first run. The second pass should never report any fixable errors. It may take  considerably  longer  than  the
> > first pass, because the first pass may have generated long list of modifications that have to
> > be scanned for each disk read.


> -w     Write changes to disk immediately.

> -y     Same as -a (automatically repair filesystem) for compatibility with other fsck tools.

> If -a and -r are absent, the file system is only checked, but not repaired.

EXIT STATUS
> 0      No recoverable errors have been detected.

  1. Recoverable errors have been detected or dosfsck has discovered an internal inconsistency.

> 2      Usage error. dosfsck did not access the file system.

FILES
> fsck0000.rec, fsck0001.rec, ...
> > When recovering from a corrupted file system, dosfsck dumps recovered data into  files  named
> > fsckNNNN.rec in the top level directory of the file system.

BUGS

> Does  not  create . and .. files where necessary. Does not remove entirely empty directories. Should
> give more diagnostic messages. Undeleting files should use a more sophisticated algorithm.


### fsck.msdos ###
### mkfs.vfat ###
### fsck.vfat ###
### mkfs.msdos ###

> ntfsprogs
> hfsprogs
> mtd-utils, genromfs. ocfs2-tools, nilfs2-tools

## Compression tools ##
### Anti Virus ###
### SPAM Filters ###
### File Management tools ###
### Archiving ###
### Backups ###
### Time snapshots of disk ###
### Disk Management tools ###