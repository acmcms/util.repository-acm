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

Require ListDistroProvides
ListDistroProvides --select-changed --filter-and-cut "source-process" | grep -e " acm-domain$" | cut -d" " -f1 | sort | uniq | while read -r projectName ; do
	Async "`basename "$projectName"`" MakeProjectAcmDomain "$projectName"
	wait
done
