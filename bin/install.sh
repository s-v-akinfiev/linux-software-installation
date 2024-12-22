#!/usr/bin/env bash

source ./bin/functions/print.sh
source ./bin/functions/instructions.sh

print_welcome_message
verify_sudo
run_instructions
