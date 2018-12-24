#!/bin/bash
set -ex

echo "executable_path: ${executable_path}"
echo "google_service_plist: ${google_service_plist}"
echo "dsym_dirs: ${dsym_dirs}"

if [ -s "${executable_path}" ]; then
    echo "[!] Can't find Fabric executable"
    echo "[!] File doesn't exists at path '${executable_path}'"
    exit 1
fi

if [ -s "${google_service_plist}" ]; then
    echo "[!] Can't find GoogleService-Info.plist"
    echo "[!] File doesn't exists at path '${google_service_plist}'"
    exit 1
fi

if [ -d "${dsym_dirs}" ]; then
    echo "[!] Can't find dSYM files"
    echo "[!] Dir doesn't exists at path '${dsym_dirs}'"
    exit 1
fi

"${executable_path}" -gsp "${google_service_plist}" -p ios "${dsym_dirs}"

exit 0
