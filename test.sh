#!/usr/bin/env bash

# Exit on error
set -e

set -o pipefail

ERRORS=()

# Run shellcheck on all the script
for f in $(find . -type f -name "*.sh" -not -name "setup.sh" | sort -u); do
	if file "$f" | grep --quiet shell; then
		{
			shellcheck "$f" && echo "[OK]: sucessfully linted $f"
		} || {
			# add to errors
			ERRORS+=("$f")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	echo "No errors, hooray"
else
	echo "These files failed shellcheck: ${ERRORS[*]}"
	exit 1
fi