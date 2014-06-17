#!/usr/bin/env ruby
require 'thor'
require 'pry'

class Install < Thor::Group
  include Thor::Actions

  desc 'install the workstation'

  def self.source_root
    File.dirname(__FILE__)
  end

  def link_dotfiles
    link_files 'dotfiles', '~/.'
  end

  def link_vim_plugins_conf
    empty_directory '~/.vim/plugin'
    link_folder 'vim-settings', '~/.vim/plugin/settings'
  end

  def link_functions
    link_folder 'functions', '~/.functions'
  end

  private

  def link_folder(folder, destination)
    return if link? folder
    link_file "../#{folder}", destination
  end

  def link_files(folder, destination)
    return if link? folder
    files_in("#{folder}/") do |file|
      link_file "../#{folder}/#{file}", "#{destination}#{file}"
    end
  end

  def link?(folder)
    no? "link the #{folder} files? [y|n]", :red
  end

  def files_in(folder)
    Dir.foreach(folder) do |file|
      yield file if file != '.' and file != '..'
    end
  end

end

Install.start
