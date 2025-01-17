#!/bin/bash
cp "$PWD/lib32Creamlinux.so" /tmp/lib32Creamlinux.so
cp "$PWD/lib64Creamlinux.so" /tmp/lib64Creamlinux.so
cp "$PWD/$(find . -name "libsteam_api.so" -printf "%P\n" | head -n 1)" /tmp/libsteam_api.so
LD_PRELOAD="$LD_PRELOAD /tmp/lib64Creamlinux.so /tmp/lib32Creamlinux.so /tmp/libsteam_api.so" "$@"
EXITCODE=$?
rm /tmp/lib32Creamlinux.so
rm /tmp/lib64Creamlinux.so
rm /tmp/libsteam_api.so
exit $EXITCODE
