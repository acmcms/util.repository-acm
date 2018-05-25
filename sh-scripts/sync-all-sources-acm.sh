#!/usr/bin/env bash

if [ -z "$MMDAPP" ] ; then
	set -e
	export MMDAPP="$( cd $(dirname "$0")/../../../.. ; pwd )"
	echo "$0: Working in: $MMDAPP"  >&2
	[ -d "$MMDAPP/source" ] || ( echo "expecting 'source' directory." >&2 && exit 1 )
fi

. "`myx.common which lib/async`"
. "`myx.common which lib/gitCloneSync`"

async(){
	Async -2 GitCloneSync "$MMDAPP/source/$@"
}

async "acm/util.repository-acm/"    "git@github.com:acmcms/util.repository-acm.git"

async "acm/acm.impl-acmbsd/"        "git@github.com:vlapan/acmbsd.git"

wait

INF="$MMDAPP/source/acm/util.repository-acm/data/repository/repository.inf"
( set -e ; echo "# copied from $INF at `date`" ; cat "$INF" ) > "$MMDAPP/source/acm/repository.inf"
