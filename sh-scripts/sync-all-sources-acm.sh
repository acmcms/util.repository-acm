#!/usr/bin/env bash

if [ -z "$APP" ] ; then
	set -e
	APP="$( cd $(dirname "$0")/../../../.. ; pwd )"
	echo "$0: Working in: $APP"  >&2
	[ -d "$APP/source" ] || ( echo "expecting 'source' directory." >&2 && exit 1 )
fi

[ -f "$APP/source/myx/util.repository-myx/sh-lib/syncing.sh.include" ] /
	|| (myx.common lib/gitCloneSync "$APP/source/myx/util.repository-myx" "git@github.com:myx/util.repository-myx.git")
	
. "$APP/source/myx/util.repository-myx/sh-lib/syncing.sh.include"

async -2 gitSync "acm/util.repository-acm/"    "git@github.com:acmcms/util.repository-acm.git"

async -2 gitSync "acm/acm.impl-acmbsd/"        "git@github.com:vlapan/acmbsd.git"

wait

INF="$APP/source/acm/util.repository-acm/data/repository/repository.inf"
( set -e ; echo "# copied from $INF at `date`" ; cat "$INF" ) > "$APP/source/acm/repository.inf"
