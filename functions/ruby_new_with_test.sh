#!/bin/sh

ruby_new_with_test() {
  name=$1;

  if [ -z "${name}" ]; then
    echo 'usage ./ruby-new-with-test <name>';
    return;
  fi

  mkdir ${name}
  cd ${name}
  touch "${name}.rb"
  echo "--color" > ".rspec"
  mkdir spec
  echo -e "require 'spec_helper'\n\ndescribe '${name}' do\nend" > "spec/${name}_spec.rb"
  echo "Dir['*.rb'].each { |f| require_relative \"../#{f}\" }" > "spec/spec_helper.rb"
}
