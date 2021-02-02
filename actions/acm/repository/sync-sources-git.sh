#!/bin/sh

[ -d "$MMDAPP/source" ] || ( echo "ERROR: expecting 'source' directory." >&2 && exit 1 )

. "$MMDAPP/source/acm/util.repository-acm/sh-scripts/sync-all-sources-acm.sh"
