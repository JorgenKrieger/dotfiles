# Colors
ESC_SEQ="\x1b["
COL_BOLD=$ESC_SEQ"1m"
COL_UNDER=$ESC_SEQ"4m"
COL_DIM=$ESC_SEQ"2m"
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# Echos
function installer() {
  echo -e "\n$BOLD$COL_CYAN\[._.]/$COL_RESET" - $COL_BOLD$COL_UNDER$1$COL_RESET
}

function running() {
  echo -e "$COL_YELLOW ⇒ $COL_RESET"$1""
}

function action() {
  echo -e "\n${COL_YELLOW}Action:$COL_RESET $COL_BOLD$1...$COL_RESET"
}

function warn() {
  echo -e "$COL_YELLOW[warning]$COL_RESET "$1
}

function ok() {
  echo -e "${COL_GREEN}Ok$COL_RESET "$1
}

function error() {
  echo -e "${COL_RED}Error$COL_RESET "$1
}

function dim() {
  echo -e $COL_DIM$1$COL_RESET
}
