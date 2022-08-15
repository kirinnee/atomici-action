#! /bin/sh

set -eu

[ "${BINARY_CACHE}" = '' ] && exit 0

for str in ${BINARY_CACHE}; do
	cachix use "${str}"
done
