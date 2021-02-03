MakeProjectAcmDomain(){
	local MDSC_SOURCE="${MDSC_SOURCE:-$MMDAPP/cached/sources}"
	local MDSC_OUTPUT="${MDSC_OUTPUT:-$MMDAPP/output/distro}"
	
	local projectName="$1"
	if [ -z "$projectName" ] ; then
		echo "MakeProjectAcmDomain: 'projectName' argument is required!" >&2 ; exit 1
	fi
	
	[ -z "$MDSC_DETAIL" ] || echo "MakeProjectAcmDomain: project: $projectName, source: $MDSC_SOURCE, output: $MDSC_OUTPUT" >&2
	
	local CHECK_DIR="$MDSC_SOURCE/$projectName/protected"
	local BUILT_DIR="$MDSC_OUTPUT/$projectName/protected"
	mkdir -p "$BUILT_DIR"
	rsync -ai --delete "$CHECK_DIR/" "$BUILT_DIR" 2>&1 \
	| (grep -v --line-buffered -E '>f\.\.t\.+ ' >&2 || true)
}

MakeDistroAcmDomains(){
	local projectName
	Require ListDistroProvides
	ListDistroProvides --select-changed --filter-and-cut "source-process" | grep -e " acm-domain$" | cut -d" " -f1 \
	| sort -u \
	| while read -r projectName ; do
		Async "$( basename "$projectName" )" MakeProjectAcmDomain "$projectName"
		wait
	done
}

MakeDistroAcmDomains "$@"