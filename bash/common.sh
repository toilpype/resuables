#!/bin/bash
### This is a template of commonly used bash scripts

# Stops when error occurs
set -e
trap "echo '[ERROR] install failed!' >&2" ERR

# Check arguments
if [ $# -ne 1 ]; then
    echo "Provide 1 argument: a directory. (ex: ~/Downloads)"
    exit 1
fi

# Get the script dir (useful when calling the script outside the script dir)
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
