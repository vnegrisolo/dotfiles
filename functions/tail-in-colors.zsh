build_tail_sed_command() {
  sed_command="sed";
  sed_replacement $color_cyan 'DEBUG' 'debug';
  sed_replacement $color_green 'INFO' 'info' 'SUCCESS' 'Success' 'success';
  sed_replacement $color_yellow 'WARN[ING]*' 'warn[ing]*';
  sed_replacement $color_red 'FATAL' 'fatal';
  sed_replacement $color_red 'ERROR' 'Error' 'error';
  sed_replacement $color_red 'EXCEPTION' 'Exception' 'exception';
  sed_replacement $color_red 'FAIL[URE]*' 'Fail[ure]*' 'fail[ure]*';
}

tail-in-colors() {
  temp="/tmp/$0-`date +'%F-%T'`-${RANDOM}";
  tmp_file=`mktemp ${temp}`;

  build_tail_sed_command;

  (command tail $@ ; echo $? > $tmp_file) | eval $sed_command;
  read exit_code < $tmp_file
  rm ${temp};

  return $exit_code;
}
