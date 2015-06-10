#!/bin/sh
set -e

URLS="git@github.com:bittorf/kalua.git
https://github.com/bittorf/kalua.git
https://github.com/bittorf/kalua
/tmp/gitmirror/github.com/bittorf/kalua.git
file://tmp/gitmirror/github.com/bittorf/kalua.git
file:///tmp/gitmirror/github.com/bittorf/kalua.git"

cd $(dirname ${0} )
for URL in ${URLS}; do
	echo
	date
	echo "Testing ${URL}"
	set -x
	sh ../git --no-pager --bare clone --branch bernd --depth 1 "${URL}" kalua
	set +x
	rm -r -f "./kalua"
	#read -p "Press any key to continue..." readEnterKey
done
exit 0

# --depth 1 does not work ?
