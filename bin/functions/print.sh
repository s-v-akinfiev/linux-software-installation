RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"

print_welcome_message() {
    echo -e "${CYAN}"
    echo "############################################################"
    echo "#                                                          #"
    echo "#    Welcome to the Ubuntu Software Installation Script    #"
    echo "#                                                          #"
    echo "############################################################"
    echo -e "${RESET}"
    echo -e "${GREEN}This script will automatically install essential software,${RESET}"
    echo -e "${GREEN}apply updates, and configure your system for optimal usage.${RESET}"
    echo -e "${GREEN}Instructions that will be run you can find in \`instructions\` directory.${RESET}"
    echo ""
    echo -e "${YELLOW}Please note:${RESET} You will need to provide ${RED}sudo${RESET} access to install the software."
    echo ""
    echo -e "${BLUE}Let's get started!${RESET}"
    echo ""
}

print_title() {
    local title="$1"
    local length=${#title}
    local border=$(printf '=%.0s' $(seq 1 $((length + 4))))

    echo -e "${BLUE}${border}${RESET}"
    echo -e "${MAGENTA}  $title  ${RESET}"
    echo -e "${BLUE}${border}${RESET}"
}

print_error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${RESET} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${RESET} $1"
}

print_info() {
    echo -e "${CYAN}[INFO]${RESET} $1"
}

print_debug() {
    echo -e "${WHITE}[DEBUG]${RESET} $1"
}

print_line() {
    echo -e "${WHITE}------------------------------${RESET}"
    if [[ "$1" != "no-space" ]]; then
        echo -e
    fi
}
