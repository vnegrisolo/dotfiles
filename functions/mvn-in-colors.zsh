build_mvn_sed_command() {
  sed_command="sed";
  sed_replacement $color_white '.*-\{55\}\+$' '.*\[INFO\] Building.*' '^Running .*'
  sed_replacement $color_white '^ T E S T S$' '^Results.*';
  sed_replacement $color_cyan '.*\[INFO\] Scanning for projects.*';
  sed_replacement $color_green '^Tests run:.*Failures: 0.*Errors: 0.*Skipped: 0.*'
  sed_replacement $color_green '.*\[INFO\] BUILD SUCCESS$';
  sed_replacement $color_yellow '.*\[WARNING].*' '.*WARN.*'
  sed_replacement $color_yellow '^NOTE: Maven is executing in offline mode\.'
  sed_replacement $color_yellow '^Tests run:.*Failures: 0, Errors: 0, Skipped: [^0].*';
  sed_replacement $color_red '.*\[ERROR\].*' '.* <<< ERROR!$' '.*\[INFO\] BUILD FAILURE' '.* <<< FAILURE!$'
  sed_replacement $color_red '^Tests in error:.*' '^Tests run:.*Failures: [^0].*' '^Tests run:.*Errors: [^0].*';
}

mvn-in-colors() {
  temp="/tmp/$0-`date +'%F-%T'`-${RANDOM}";
  tmp_file=`mktemp ${temp}`;

  build_mvn_sed_command;

  (command /opt/maven/bin/mvn $@ ; echo $? > $tmp_file) | eval $sed_command;
  read exit_code < $tmp_file
  rm -f ${temp};

  return $exit_code;
}

mvn-debug-in-colors() {
  temp="/tmp/$0-`date +'%F-%T'`-${RANDOM}";
  tmp_file=`mktemp ${temp}`;

  build_mvn_sed_command;

  (command /opt/maven/bin/mvnDebug $@ ; echo $? > $tmp_file) | eval $sed_command;
  read exit_code < $tmp_file
  rm -f ${temp};

  return $exit_code;
}
