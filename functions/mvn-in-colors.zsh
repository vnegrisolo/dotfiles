mvn-in-colors() {
  local color_black=$(tput setaf 1);
  local color_red=$(tput setaf 1);
  local color_green=$(tput setaf 2);
  local color_yellow=$(tput setaf 3);
  local color_blue=$(tput setaf 4);
  local color_pink=$(tput setaf 5);
  local color_cyan=$(tput setaf 6);
  local color_white=$(tput setaf 7);
  local color_reset=$(tput sgr0);

  echo -ne ${color_reset}

  rm -f /tmp/mvn-in-colors
  tmp_file=`mktemp /tmp/mvn-in-colors`

  (command mvn $@ ; echo $? > $tmp_file) | sed \
    -e "s/\(.*-\{55\}\+$\)/${color_white}\1${color_reset}/g" \
    -e "s/\(.*\[INFO\] Scanning for projects.*\)/${color_cyan}\1${color_reset}/g" \
    -e "s/\(.*\[INFO\] Building.*\)/${color_white}\1${color_reset}/g" \
    -e "s/\(^Running .*\)/${color_white}\1${color_reset}/g" \
    -e "s/\(^ T E S T S$\)/${color_white}\1${color_reset}/g" \
    -e "s/\(^Results.*\)/${color_white}\1${color_reset}/g" \
    -e "s/\(^Tests run:.*Failures: 0.*Errors: 0.*Skipped: 0.*\)/${color_green}\1${color_reset}/g" \
    -e "s/\(.*\[INFO\] BUILD SUCCESS$\)/${color_green}\1${color_reset}/g" \
    -e "s/\(.*\[WARNING].*\)/${color_yellow}\1${color_reset}/g" \
    -e "s/\(^NOTE: Maven is executing in offline mode\.\)/${color_yellow}\1${color_reset}/g" \
    -e "s/\(^Tests run:.*Failures: 0, Errors: 0, Skipped: [^0].*\)/${color_yellow}\1${color_reset}/g" \
    -e "s/\(.*\[ERROR\].*\)/${color_red}\1${color_reset}/g" \
    -e "s/\(.*\[INFO\] BUILD FAILURE\)/${color_red}\1${color_reset}/g" \
    -e "s/\(.* <<< FAILURE!$\)/${color_red}\1${color_reset}/g" \
    -e "s/\(.* <<< ERROR!$\)/${color_red}\1${color_reset}/g" \
    -e "s/\(^Tests in error:.*\)/${color_red}\1${color_reset}/g" \
    -e "s/\(^Tests run:.*Failures: [^0].*\)/${color_red}\1${color_reset}/g" \
    -e "s/\(^Tests run:.*Errors: [^0].*\)/${color_red}\1${color_reset}/g"

  echo -ne ${color_reset}

  read mvn_exit_code < $tmp_file
  \rm -f $tmp_file

  return $mvn_exit_code
}
