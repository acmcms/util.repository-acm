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

async "acm/acm-install-freebsd/"    "git@github.com:acmcms/acm-install-freebsd.git"
async "acm/acm.impl-acmbsd/"        "git@github.com:vlapan/acmbsd.git"

async "acm/acm-devel-tools/"	    "git@github.com:acmcms/acm-devel-tools.git"
async "acm/util.repository-acm/"    "git@github.com:acmcms/util.repository-acm.git"

wait

async "acm/acm-base-api/"			"git@github.com:acmcms/acm-base-api.git"
async "acm/acm-base-sdk/"			"git@github.com:acmcms/acm-base-sdk.git"

async "acm/acm-boot-2002-stage1/"	"git@github.com:acmcms/acm-boot-2002-stage1.git"
async "acm/acm-boot-2002-stage2/"	"git@github.com:acmcms/acm-boot-2002-stage2.git"

wait

async "acm/acm-plug-email/"		    "git@github.com:acmcms/acm-plug-email.git"
async "acm/acm-plug-messaging/"		"git@github.com:acmcms/acm-plug-messaging.git"
async "acm/acm-plug-webdav/"		"git@github.com:acmcms/acm-plug-webdav.git"


wait

async "acm/acm-plug-launcher/"	    "git@github.com:acmcms/acm-plug-launcher.git"
async "acm/acm-plug-s2/"			"git@github.com:acmcms/acm-plug-s2.git"
async "acm/acm-plug-s3/"			"git@github.com:acmcms/acm-plug-s3.git"
async "acm/acm-plug-u1/"			"git@github.com:acmcms/acm-plug-u1.git"

wait 

async "acm/acm-skin-ctrl-ie6/"	    "git@github.com:acmcms/acm-skin-ctrl-ie6.git"
async "acm/acm-skin-ctrl-simple/"	"git@github.com:acmcms/acm-skin-ctrl-simple.git"
async "acm/acm-skin-ctrl-temp/"		"git@github.com:acmcms/acm-skin-ctrl-temp.git"
async "acm/acm-skin-ctrl-temp-ie6/"	"git@github.com:acmcms/acm-skin-ctrl-temp-ie6.git"

wait

async "acm/acm-srv-acmcms/"			"git@github.com:acmcms/acm-srv-acmcms.git"
async "acm/acm-srv-download/"		"git@github.com:acmcms/acm-srv-download.git"
async "acm/acm-srv-proxy/"			"git@github.com:acmcms/acm-srv-proxy.git"


wait

INF="$MMDAPP/source/acm/util.repository-acm/data/repository/repository.inf"
( set -e ; echo "# copied from $INF at `date`" ; cat "$INF" ) > "$MMDAPP/source/acm/repository.inf"
