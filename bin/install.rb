#!/usr/bin/env ruby
require 'thor'

class Install < Thor::Group
  include Thor::Actions

  def self.source_root
    File.expand_path('..', File.dirname(__FILE__))
  end

  desc 'install dotfiles'

  def install
    files_in('dotfiles/') do |file|
      link_file "dotfiles/#{file}", "~/.#{file}", force: true
    end

    empty_directory '~/.vim/plugin'
    link_file 'vim-settings', '~/.vim/plugin/settings'

    template('templates/secrets.erb', '~/.env-vars.secrets', skip: true)
  end

  private

  def files_in(folder)
    Dir.foreach(folder) do |file|
      yield file if file != '.' && file != '..'
    end
  end
end

Install.start
