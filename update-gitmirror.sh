#!/bin/sh
set -x
set -e

set -- $( find /$HOME/var/cache/gitmirror/ -type d -name "*.git" )
cd "${1}"
/usr/bin/git remote update

