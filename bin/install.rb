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
    return if no? "#{__method__}? [y|n]", :red
    link_files 'dotfiles', '~/.'
  end

  def link_vim_plugins_conf
    return if no? "#{__method__}? [y|n]", :red
    empty_directory '~/.vim/plugin'
    link_folder 'vim-settings', '~/.vim/plugin/settings'
  end

  def link_functions
    return if no? "#{__method__}? [y|n]", :red
    link_folder 'functions', '~/.functions'
  end

  private

  def link_folder(folder, destination)
    link_file "../#{folder}", destination
  end

  def link_files(folder, destination)
    files_in("#{folder}/") do |file|
      link_file "../#{folder}/#{file}", "#{destination}#{file}"
    end
  end

  def files_in(folder)
    Dir.foreach(folder) do |file|
      yield file if file != '.' and file != '..'
    end
  end

end

Install.start
