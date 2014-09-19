color_reset=$(tput sgr0);
color_black="$(tput setaf 0)\1${color_reset}";
color_red="$(tput setaf 1)\1${color_reset}";
color_green="$(tput setaf 2)\1${color_reset}";
color_yellow="$(tput setaf 3)\1${color_reset}";
color_blue="$(tput setaf 4)\1${color_reset}";
color_pink="$(tput setaf 5)\1${color_reset}";
color_cyan="$(tput setaf 6)\1${color_reset}";
color_white="$(tput setaf 7)\1${color_reset}";

function colors_reset() {
  echo -ne ${color_reset};
}

function sed_replacement() {
  local color=$1;
  local text=$2;

  for i in {2..$#@}; do;
    sed_command="$sed_command -e \"s/\($@[$i]\)/${color}/g\"";
  done
}
