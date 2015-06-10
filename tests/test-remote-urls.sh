#!/bin/sh
set -x
set -e

#URLS="git@github.com:bittorf/kalua.git
#https://github.com/bittorf/kalua.git
#https://github.com/bittorf/kalua
#$HOME/var/cache/gitmirror/github.com/bittorf/kalua.git
#file://$HOME/var/cache/gitmirror/github.com/bittorf/kalua.git
#file:///$HOME/var/cache/gitmirror/github.com/bittorf/kalua.git"

URLS="http://git.openwrt.org/packages.git"


cd $(dirname ${0} )
for URL in "http://git.openwrt.org/packages.git" \ 
	do

	echo
	echo "Testing ${URL}"

	for TEST in "sh -x ../git clone --depth 1" \
				"sh -x ../git clone" \
				"sh -x ../git --no-pager --bare clone --depth 1" \
#				"git svn clone -r HEAD" \
	do
		date
		echo "${TEST} ${URL}"
		${TEST} ${URL}
		rm -rf packages
	done

	read -p "Press any key to continue..." readEnterKey
done
exit 0

# --depth 1 does not work ?

