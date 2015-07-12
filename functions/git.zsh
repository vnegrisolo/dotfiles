function files-git-diff() {
  files_gd=`git clean --dry-run | awk '{print $3;}'`;
  files_gd=("$files_gd" `git ls-files --others --exclude-standard`);
  files_gd=("$files_gd" `git diff --name-only`);
  files_gd=("$files_gd" `git diff ..master --name-only`);
}
