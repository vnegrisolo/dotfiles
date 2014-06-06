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
    if yes?('link all dotfiles? [y|n]')
      Dir.foreach("dotfiles/") do |file|
        next if file == '.' or file == '..'
        link_file "../dotfiles/#{file}", "~/.#{file}"
      end
    end
  end

  def link_vim_plugins_conf
    if yes?('link all vim plugin conf files? [y|n]')
      empty_directory '~/.vim/plugin'
      link_file '../vim/plugin/settings', '~/.vim/plugin/settings'
    end
  end

  def link_scripts
    if yes?('link all function files? [y|n]')
      Dir.foreach("functions/") do |file|
        next if file == '.' or file == '..'
        link_file "../functions/#{file}", "~/#{file}"
      end
    end
  end

end

Install.start
