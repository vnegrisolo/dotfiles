function build_tail_sed_command() {
  sed_command='sed';
  sed_replacement $color_cyan 'SELECT' 'FROM' 'JOIN' 'WHERE' 'ORDER' 'GROUP' 'LIMIT';
  sed_replacement $color_cyan 'DEBUG' 'debug';
  sed_replacement $color_green 'INFO' 'info' 'SUCCESS' 'Success' 'success';
  sed_replacement $color_yellow 'WARN[ING]*' 'warn[ing]*';
  sed_replacement $color_red 'ERRO[R]*' 'Erro[r]*' 'erro[r]*';
  sed_replacement $color_red 'EXCEPTION' 'Exception' 'exception';
  sed_replacement $color_red 'FAIL[URE]*' 'Fail[ure]*' 'fail[ure]*';
  sed_replacement $color_red 'FATAL' 'fatal';
}

function tail-in-colors() {
  temp="/tmp/$0-`date +'%F-%T'`-$RANDOM";
  touch $temp;

  build_tail_sed_command;

  (command tail $@ ; echo $? > $temp) | eval $sed_command;
  read exit_code < $temp
  rm $temp;

  return $exit_code;
}
