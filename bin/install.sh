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
skipped_instructions=()
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
        print_line

        failed_instructions+=("$script")
        continue
    fi

    if bash -c "source $script; declare -f is_installed" &>/dev/null; then
      if bash -c "source $script; is_installed"; then
          skipped_installations+=("$title ($script)")

          print_info "Instruction $script is already installed. Skipping."
          print_line
          continue
      fi
    fi

    print_info "Running instruction $script: $title"
    bash -c "source $script; run"

    if [[ $? -eq 0 ]]; then
        success_instructions+=("$title ($script)")

        print_success "$script installed successfully."
    else
      failed_instructions+=("$title ($script)")

      print_error "Failed to install $script."
    fi

    print_line
done

if [[ ${#success_instructions[@]} -gt 0 ]]; then
    print_success "Successfully executed the following instructions:"
    for software in "${success_instructions[@]}"; do
        echo -e "${GREEN}  - $software${RESET}"
    done
fi

if [[ ${#skipped_installations[@]} -gt 0 ]]; then
    print_info "Skipped Installations (Already Installed):"
    for software in "${skipped_installations[@]}"; do
        echo -e "${CYAN}  - $software${RESET}"
    done
fi

if [[ ${#failed_instructions[@]} -gt 0 ]]; then
    print_error "Failed instructions:"
    for software in "${failed_instructions[@]}"; do
        echo -e "${RED}  - $software${RESET}"
    done
fi
