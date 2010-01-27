#!/bin/bash


###      Put update on SVN   -- save changes
unzip -u book.odt  # This will upzip 
svn add ./*
svn ci

###    Get update from SVN   -- get changes
svn update
zip -vr bookold.odt * -x "*.svn*" "*.odt"

exit 0
