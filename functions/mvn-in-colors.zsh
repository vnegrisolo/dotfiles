source ~/.functions/colors.zsh;

mvn-in-colors() {
  colors;

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

  read exit_code < $tmp_file
  \rm -f $tmp_file

  return $exit_code
}
