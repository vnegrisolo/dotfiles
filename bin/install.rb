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
    return if no? 'link the dotfiles? [y|n]', :red
    files_in("dotfiles/") do |file|
      link_file "../dotfiles/#{file}", "~/.#{file}"
    end
  end

  def link_vim_plugins_conf
    return if no? 'link the vim plugin conf files? [y|n]', :red
    empty_directory '~/.vim/plugin'
    link_file '../vim/plugin/settings', '~/.vim/plugin/settings'
  end

  def link_functions
    return if no? 'link the function files? [y|n]', :red
    files_in("functions/") do |file|
      link_file "../functions/#{file}", "~/#{file}"
    end
  end

  private

  def files_in(folder)
    Dir.foreach(folder) do |file|
      yield file if file != '.' and file != '..'
    end
  end

end

Install.start
