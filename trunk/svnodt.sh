#!/bin/bash


###      Put update on SVN   -- save changes
unzip -u book.odt  -d ./booksrc # This will upzip , Your book.odt into new files
svn add ./*        # We need to add any new files before updating. This will add all files so do not put anything init.
svn ci

###    Get update from SVN   -- get changes
svn update
zip -vr bookold.odt * -x "*.svn*" "*.odt"

exit 0
