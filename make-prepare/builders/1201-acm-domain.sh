
if [ "`type -t ListChangedSourceProjects`" != "function" ] ; then
. "$MMDAPP/source/myx/myx.distro-prepare/sh-scripts/list-changed-source-projects.sh"
fi
if [ "`type -t ListCachedProjectProvides`" != "function" ] ; then
. "$MMDAPP/source/myx/myx.distro-prepare/sh-scripts/list-cached-project-provides.sh"
fi

MakeProjectAcmDomain(){
	local PKG="${1#$MMDAPP/source/}"
	if [ -z "$PKG" ] ; then
		echo "MakeProjectAe3Packages: 'PKG' argument is required!" >&2 ; exit 1
	fi
	
	local CHECK_DIR="$MMDAPP/cached/source/$PKG/protected"
	local BUILT_DIR="$MMDAPP/output/distro/$PKG/protected"
	mkdir -p "$BUILT_DIR"
	rsync -a -i --delete "$CHECK_DIR/" "$BUILT_DIR"
}

for PKG in `ListChangedSourceProjects` ; do
	if test ! -z "`ListCachedProjectProvides "$PKG" "build-prepare" | grep -e "^acm-domain$"`" ; then
		Async "`basename "$PKG"`" MakeProjectAcmDomain "$PKG"
		wait
	fi
done
