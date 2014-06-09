colors() {
  color_black=$(tput setaf 1);
  color_red=$(tput setaf 1);
  color_green=$(tput setaf 2);
  color_yellow=$(tput setaf 3);
  color_blue=$(tput setaf 4);
  color_pink=$(tput setaf 5);
  color_cyan=$(tput setaf 6);
  color_white=$(tput setaf 7);
  color_reset=$(tput sgr0);

  echo -ne ${color_reset}
}
