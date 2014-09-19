build_sed_command() {
  sed_command="sed";
  sed_replacement $color_white '.*-\{55\}\+$' '.*\[INFO\] Building.*' '^Running .*' '^ T E S T S$' '^Results.*';
  sed_replacement $color_cyan '.*\[INFO\] Scanning for projects.*';
  sed_replacement $color_green '^Tests run:.*Failures: 0.*Errors: 0.*Skipped: 0.*' '.*\[INFO\] BUILD SUCCESS$';
  sed_replacement $color_yellow '.*\[WARNING].*' '.*WARN.*' '^NOTE: Maven is executing in offline mode\.' '^Tests run:.*Failures: 0, Errors: 0, Skipped: [^0].*';
  sed_replacement $color_red '.*\[ERROR\].*' '.*\[INFO\] BUILD FAILURE' '.* <<< FAILURE!$' '.* <<< ERROR!$' '^Tests in error:.*' '^Tests run:.*Failures: [^0].*' '^Tests run:.*Errors: [^0].*';
}

mvn-in-colors() {
  temp="/tmp/$0-`date +'%F-%T'`-${RANDOM}";
  tmp_file=`mktemp ${temp}`;

  build_sed_command;

  (command /opt/maven/bin/mvn $@ ; echo $? > $tmp_file) | eval $sed_command;
  read exit_code < $tmp_file
  rm -f ${temp};

  return $exit_code;
}

mvn-debug-in-colors() {
  temp="/tmp/$0-`date +'%F-%T'`-${RANDOM}";
  tmp_file=`mktemp ${temp}`;

  build_sed_command;

  (command /opt/maven/bin/mvnDebug $@ ; echo $? > $tmp_file) | eval $sed_command;
  read exit_code < $tmp_file
  rm -f ${temp};

  return $exit_code;
}
