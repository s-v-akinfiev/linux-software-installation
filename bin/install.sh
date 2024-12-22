#!/usr/bin/env bash

source ./bin/functions/print.sh
source ./bin/functions/instructions.sh

print_welcome_message
verify_sudo

if [[ $# -gt 0 ]]; then
    MIGRATION_NAME="$1"
    run_instruction "$MIGRATION_NAME"
else
    run_instructions $1
fi
