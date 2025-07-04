#!/bin/sh

####
## Note: this is a special script that is designed 
##       to run stand-alone (no location on local 
##       file-system) and on un-prepared OS. 
####

TGT_APP_PATH="${TGT_APP_PATH:-$1}"
test -z "$TGT_APP_PATH" && echo "'TGT_APP_PATH' env must be set" >&2 && exit 1

##########################
echo "Installing myx.common"

FetchStdout(){
	local URL="$1"
	[ -z "$URL" ] && echo "FetchStdout: The URL is required!" && exit 1
	set -e

	if [ -n "`which curl || true`" ]  ; then curl --silent -L $URL  ; return 0 ; fi
	if [ -n "`which fetch || true`" ] ; then fetch -o - $URL        ; return 0 ; fi
	if [ -n "`which wget || true`" ]  ; then wget --quiet -O - $URL ; return 0 ; fi

	echo "ERROR: curl, fetch or wget were not found, do not know how to download!"
	exit 1
}

FetchStdout https://raw.githubusercontent.com/myx/os-myx.common/master/sh-scripts/install-myx.common.sh -o - | sh -e

myx.common lib/installEnsurePackage bash git || true

###########################################################
echo "Installing ACM repository into: $TGT_APP_PATH"

export MMDAPP="$TGT_APP_PATH"

myx.common git/cloneSync "$MMDAPP/source/acm/util.repository-acm" "git@github.com:acmcms/util.repository-acm.git"

INF="$MMDAPP/source/acm/util.repository-acm/sh-data/repository/repository.inf"
( set -e ; echo "# copied from $INF at `date`" ; cat "$INF" ) > "$MMDAPP/source/acm/repository.inf"

############
echo "Done."