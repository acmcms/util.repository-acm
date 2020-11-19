Require ListChangedSourceProjects
Require ListProjectProvides

MDSC_SOURCE="${MDSC_SOURCE:-$MMDAPP/cache/sources}"

MakeProjectAcmDomain(){
	local projectName="$1"
	if [ -z "$projectName" ] ; then
		echo "MakeProjectAe3Packages: 'projectName' argument is required!" >&2 ; exit 1
	fi
	
	local CHECK_DIR="$MDSC_SOURCE/$projectName/protected"
	local BUILT_DIR="$MMDAPP/output/distro/$projectName/protected"
	mkdir -p "$BUILT_DIR"
	rsync -a -i --delete "$CHECK_DIR/" "$BUILT_DIR"
}

for projectName in $( ListChangedSourceProjects ) ; do
	if [ ! -z "$( ListProjectProvides "$projectName" --print-provides-only --filter-and-cut "source-process" | grep -e "^acm-domain$" )" ] ; then
		Async "`basename "$projectName"`" MakeProjectAcmDomain "$projectName"
		wait
	fi
done
