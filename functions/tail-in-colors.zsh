source ~/colors.zsh;

tail-in-colors() {
  colors;

  rm -f /tmp/tail-in-colors
  tmp_file=`mktemp /tmp/tail-in-colors`

  (command tail $@ ; echo $? > $tmp_file) | sed \
    -e "s/\(DEBUG\)/${color_cyan}\1${color_reset}/g" \
    -e "s/\(INFO\)/${color_green}\1${color_reset}/g" \
    -e "s/\(WARN\)/${color_yellow}\1${color_reset}/g" \
    -e "s/\(FATAL\)/${color_red}\1${color_reset}/g" \
    -e "s/\(ERROR\)/${color_red}\1${color_reset}/g"

  echo -ne ${color_reset}

  read exit_code < $tmp_file
  \rm -f $tmp_file

  return $exit_code
}