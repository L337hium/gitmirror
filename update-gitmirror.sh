#!/bin/sh
set -x
set -e

set -- $( find /tmp/gitmirror/ -type d -name "*.git" )
cd "${1}"
/usr/bin/git remote update

