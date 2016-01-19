#!/usr/bin/bash
#this script is a hook for git difftool, the configuration is in the ~/.gitconfig

echo "$1 : the local path"
echo "$2 : the remote path"

if [ "${1:0:1}" = "/" ]; then
echo "local is start with /, a absolute path"
old_path="/git_tmp/old/`basename $1`"
cp -vrf $1 $old_path
old_path="d:/program/cygwin0826/git_tmp/old/`basename $1`"
else
echo "local is a relative path"
new_path="`cygpath -w $PWD`/$2"
fi

if [ "${2:0:1}" = "/" ]; then
echo "remote is start with /, a absolute path"
new_path="/git_tmp/new/`basename $2`"
cp -vrf $2 $new_path
new_path="d:/program/cygwin0826/git_tmp/new/`basename $1`"
else
echo "remote is a relative path"
new_path="`cygpath -w $PWD`/$2"
fi

#new_path="/git_tmp/new/`basename $2`"

#cp -vrf $1 $old_path
#cp -vrf $2 $new_path

#old_path="d:/program/cygwin0826$old_path"
#new_path="d:/program/cygwin0826$new_path"

echo "pass local path $old_path"
echo "pass remote path $new_path"

"/cygdrive/C/Program Files/Beyond Compare 3/BCompare.exe" "$old_path" "$new_path" & 
