Require ListChangedSourceProjects
Require ListProjectProvides

MDSC_SOURCE="${MDSC_SOURCE:-$MMDAPP/cache/sources}"

MakeProjectAcmDomain(){
	local PKG="$1"
	if [ -z "$PKG" ] ; then
		echo "MakeProjectAe3Packages: 'PKG' argument is required!" >&2 ; exit 1
	fi
	
	local CHECK_DIR="$MDSC_SOURCE/$PKG/protected"
	local BUILT_DIR="$MMDAPP/output/distro/$PKG/protected"
	mkdir -p "$BUILT_DIR"
	rsync -a -i --delete "$CHECK_DIR/" "$BUILT_DIR"
}

for PKG in $( ListChangedSourceProjects ) ; do
	if test ! -z "`ListProjectProvides "$PKG" "build-prepare" | grep -e "^acm-domain$"`" ; then
		Async "`basename "$PKG"`" MakeProjectAcmDomain "$PKG"
		wait
	fi
done
