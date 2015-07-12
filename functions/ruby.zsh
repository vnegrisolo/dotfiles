function rubocop_diff(){
  files-git-diff;
  files_rubocop=(`echo $files_gd | tr ' ' '\n' | grep \\\.rb | sort -u`);
  files_rubocop=(`find $files_rubocop 2>/dev/null`);

  echo "#=> run $(tput setaf 1)Rubocop$(tput sgr0) on diff for:";
  for f in $files_rubocop; do; echo "#=>   $f"; done

  if [ -n "$files_rubocop" ]; then; bundle exec rubocop $files_rubocop; fi
}

function haml_diff(){
  files-git-diff;
  files_haml=(`echo $files_gd | tr ' ' '\n' | grep \\\.haml | sort -u`);
  files_haml=(`find $files_haml 2>/dev/null`);

  echo "#=> run $(tput setaf 1)Haml$(tput sgr0) on diff for:";
  for f in $files_haml; do; echo "#=>   $f"; done

  if [ -n "$files_haml" ]; then; bundle exec haml-lint $files_haml; fi
}

function rspec_diff(){
  files-git-diff;
  files_rspec=(`echo $files_gd | sed 's/app\//spec\//g' | sed 's/\.rb/_spec\.rb/g' | sed 's/_spec_spec/_spec/g'`);
  files_rspec=(`echo $files_rspec | tr ' ' '\n' | grep _spec\\\.rb | sort -u`);
  files_rspec=(`find $files_rspec 2>/dev/null`);

  echo "#=> run $(tput setaf 1)RSpec$(tput sgr0) on diff for:";
  for f in $files_rspec; do; echo "#=>   $f"; done

  if [ -n "$files_rspec" ]; then; bundle exec rspec $files_rspec; fi
}
