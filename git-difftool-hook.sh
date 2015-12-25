#!/usr/bin/bash
#this script is a hook for git difftool, the configuration is in the ~/.gitconfig

echo "$1 : the local path"
echo "$2 : the remote path"

old_path="/git_tmp/old/`basename $1`"
new_path="/git_tmp/new/`basename $2`"

cp -vrf $1 $old_path
cp -vrf $2 $new_path

old_path="d:/program/cygwin0826$old_path"
new_path="d:/program/cygwin0826$new_path"

"/cygdrive/C/Program Files/Beyond Compare 3/BCompare.exe" "$old_path" "$new_path" & 
