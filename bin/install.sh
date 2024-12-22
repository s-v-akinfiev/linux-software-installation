#!/usr/bin/env bash

source ./bin/functions/print.sh

print_welcome_message

verify_sudo() {
    print_title "Verifying Sudo Access"

    if sudo -v; then
        print_success "Sudo access verified. Continuing..."
        echo -e
    else
        print_error "Error: This script requires sudo privileges to continue."
        print_warning "Please run this script with a user that has sudo privileges."
        exit 1
    fi
}

verify_sudo

INSTRUCTIONS_DIR="./instructions"
if [[ ! -d "$INSTRUCTIONS_DIR" ]]; then
    print_error "Instructions directory not found: $INSTRUCTIONS_DIR"
    exit 1
fi

success_instructions=()
failed_instructions=()
print_title 'Running instructions ...'

for script in "$INSTRUCTIONS_DIR"/*.sh; do
    if [[ ! -f "$script" ]]; then
        continue
    fi

    title=$(bash -c "source $script; get_title" 2>/dev/null)
    if [[ -z "$title" ]]; then
        print_warning "No title found for script: $script"
        title="(Unknown instruction)"
    fi

    if ! bash -c "source $script; declare -f run" &>/dev/null; then
        print_warning "No 'run' function defined in: $script"
        echo -e

        failed_instructions+=("$script")
        continue
    fi

    print_info "Running instruction $script: $title"
    bash -c "source $script; run"

    if [[ $? -eq 0 ]]; then
        success_instructions+=("$script")

        print_success "$script installed successfully."
    else
      failed_instructions+=("$script")

      print_error "Failed to install $script."
    fi

    print_line
    echo -e
done

if [[ ${#success_instructions[@]} -gt 0 ]]; then
    echo "Successfully executed the following instructions:"
    for software in "${success_instructions[@]}"; do
        echo -e "${GREEN}  - $software${RESET}"
    done
fi

if [[ ${#failed_instructions[@]} -gt 0 ]]; then
    echo "Failed instructions:"
    for software in "${failed_instructions[@]}"; do
        echo -e "${RED}  - $software${RESET}"
    done
fi
