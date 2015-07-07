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

    files_in('templates/') do |file|
      template "templates/#{file}", "~/.#{file.gsub(/\.erb/, '')}", skip: true
    end

    link_file 'functions', '~/.functions'
    link_file 'ssh/config', '~/.ssh/config'
  end

  private

  def files_in(folder)
    Dir.foreach(folder) { |file| yield file if file != '.' && file != '..' }
  end
end

Install.start
