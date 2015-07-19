function print_files(){
  echo "#=> run $(tput setaf 1)${1}$(tput sgr0) on diff for:";
  for f in ${@:2}; do; echo "#=>   $f"; done
}

function rubocop_diff(){
  files-git-diff;
  files_rubocop=(`echo $files_gd | tr ' ' '\n' | grep \\\.rb | sort -u`);
  if [ -n "$files_rubocop" ]; then; files_rubocop=(`find $files_rubocop 2>/dev/null`); fi

  print_files 'Rubocop' $files_rubocop
  if [ -n "$files_rubocop" ]; then; bundle exec rubocop $files_rubocop; fi
}

function haml_diff(){
  files-git-diff;
  files_haml=(`echo $files_gd | tr ' ' '\n' | grep \\\.haml | sort -u`);
  if [ -n "$files_haml" ]; then; files_haml=(`find $files_haml 2>/dev/null`); fi

  print_files 'Haml' $files_haml
  if [ -n "$files_haml" ]; then; bundle exec haml-lint $files_haml; fi
}

function rspec_diff(){
  files-git-diff;
  files_rspec=(`echo $files_gd | sed 's/app\//spec\//g' | sed 's/\.rb/_spec\.rb/g' | sed 's/_spec_spec/_spec/g'`);
  files_rspec=(`echo $files_rspec | tr ' ' '\n' | grep _spec\\\.rb | sort -u`);
  if [ -n "$files_rspec" ]; then; files_rspec=(`find $files_rspec 2>/dev/null`); fi

  print_files 'RSpec' $files_rspec
  if [ -n "$files_rspec" ]; then; bundle exec rspec $files_rspec; fi
}
