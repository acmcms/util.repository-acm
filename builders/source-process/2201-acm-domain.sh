#!/bin/sh
# ^^^ for syntax highlight

[ full != "$MDSC_DETAIL" ] || set -x

type Prefix >/dev/null 2>&1 || . "$( myx.common which lib/prefix )"
type Parallel >/dev/null 2>&1 || . "$( myx.common which lib/parallel )"

MakeProjectAcmDomain(){
	local MDSC_SOURCE="${MDSC_SOURCE:-$MMDAPP/source}"
	local MDSC_OUTPUT="${MDSC_OUTPUT:-$MMDAPP/output}"
	
	local projectName="$1"
	if [ -z "$projectName" ] ; then
		echo "MakeProjectAcmDomain: 'projectName' argument is required!" >&2 ; exit 1
	fi
	
	[ -z "$MDSC_DETAIL" ] || echo "MakeProjectAcmDomain: project: $projectName, source: $MDSC_SOURCE, output: $MDSC_OUTPUT" >&2
	
	local CHECK_DIR="$MDSC_SOURCE/$projectName/protected"
	local BUILT_DIR="$MDSC_OUTPUT/distro/$projectName/protected"
	mkdir -p "$BUILT_DIR"
	rsync -ai --delete "$CHECK_DIR/" "$BUILT_DIR" 2>&1 \
	| (grep -v --line-buffered -E '>f\.\.t\.+ ' >&2 || true)
}

Distro ListDistroProvides --select-changed --filter-and-cut "source-process" | grep -e " acm-domain$" \
| cut -d" " -f1 \
| Parallel -v Prefix -2 MakeProjectAcmDomain # "$projectName" 
