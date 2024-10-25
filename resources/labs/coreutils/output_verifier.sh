#!/usr/bin/env bash
# SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
# SPDX-License-Identifier: CC-BY-SA-4.0
# X-Context: Logging course - Coreutils analysis lab - Timeline output verifier script

set -e -o pipefail

IFS=$'\n'
USAGE="USAGE: ${0} /path/to/timeline_for_kim.log"
TIMELINE_FILE="${1}"

if [[ -z "${TIMELINE_FILE}" ]]; then
  echo "${USAGE}"
  exit 1
fi

if ! [[ -r "${TIMELINE_FILE}" ]]; then
  echo "ERROR: Could not open file \"${TIMELINE_FILE}\""
  echo "${USAGE}"
  exit 1
fi

echo "INFO: Checking number of lines in specified timeline file..."
LINES_IN_FILE="$(cat "${TIMELINE_FILE}" | tr -s '\r\n' | wc -l)"
if [[ "${LINES_IN_FILE}" != "20" ]] && [[ "${LINES_IN_FILE}" != "30" ]]; then
  echo 'ERROR: Number of lines in timeline file for user kim is incorrect'
  exit 1
fi

echo "INFO: Checking format of specified timeline file..."
if cat "${TIMELINE_FILE}" \
  | tr '\r' '\n' | tr -s '\r\n' \
  | grep -v -P \
    '^\d\d/\d\d \d\d:\d\d:\d\d \d+\.\d+\.\d+\.\d+ (POST|GET) [A-Za-z0-9/.%?_=&]+ \d\d\d$'; then

  echo 'ERROR: Formatting of timeline entries above does not seem correct - double-check README!'
  exit 1
fi

echo 'INFO: Checking if specified timeline file matches any of known correct hashes...'
FILE_HASH="$(cat "${TIMELINE_FILE}" | tr -s '\n\r' | sha256sum | cut -d ' ' -f 1)"
CORRECT_FILE_HASHES=(
  'a92ed41e9decb6df68811bd9863916bc75f8180580921c3ce7aa209ae393ce6a'
  'aff6bc18f1c89819c8c5cab4fc852d84262f3bd754547bc1e91ace3c19c89f4c'
  'bc329118d8cef3e25c61b2b095b4514ce3595001551493bfe0ff73f98dbcb0c4'
  'c8a10c98bc4bcd53370f8abf8ab08eda52e2c7127a357df8824724a41faf13df'
)

for CORRECT_FILE_HASH in ${CORRECT_FILE_HASHES[*]}; do
  if [[ "${FILE_HASH}" == "${CORRECT_FILE_HASH}" ]]; then
    echo 'SUCCESS: You got the correct timeline - time to submit your script for review! :-D'
    exit 0
  fi
done

echo 'ERROR: Hash of specified timeline did not match known correct digest'
echo 'HINT: You likely have an error in your sorting, formatting, filtering or dates/times'
exit 1
