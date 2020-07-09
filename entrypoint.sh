#!/bin/bash

files=(clouddeploy clouddeploy.sh cloudbuild cloudbuild.sh)

if [[ $# -gt 0 ]]; then
	files=( $1 ${files[*]} )
fi

for f in ${files[*]}; do
	f=$(dirname $f)/$(basename $f)

	[[ -e $f ]] && break

	f=/workspace/$(basename $f)

	[[ -e $f ]] && break
done

if [[ ! -e $f ]]; then
	echo "Error: Was not able to find $(basename $f)"
	exit 2
fi

if [[ ! -x $f ]]; then
	chmod +x $f
fi

exec $f $*
