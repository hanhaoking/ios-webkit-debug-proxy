#!/bin/sh
#
# Google BSD license http://code.google.com/google_bsd_license.html
# Copyright 2012 Google Inc. wrightt@google.com

run () {
  echo $*
  $* || exit 1
}

gprefix=`which glibtoolize 2>&1 >/dev/null`
if [ $? -eq 0 ]; then
  run glibtoolize --force
else
  run libtoolize --force
fi
run aclocal
run autoheader
run automake --add-missing
run autoconf

if [ -z "$NOCONFIGURE" ]; then
  run ./configure "$@"
fi
