#!/usr/bin/env bash
# set -Exeuo pipefail
# Exit on error
set -e

# Exit on error in any of pipe commands
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
	echo "You are an Bash Wizard, No errors!"
else
	echo "These files failed shellcheck: ${ERRORS[*]}"
	exit 1
fi