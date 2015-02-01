#!/usr/bin/env ruby
require 'thor'
require_relative 'workstation'

module Workstation
  class Install < Thor::Group
    include Workstation

    desc 'install the workstation'

    def self.source_root
      File.dirname(__FILE__)
    end

    def install
      link_files 'dotfiles', '~/.' if run? 'dotfiles'

      if run? 'vim plugins'
        empty_directory '~/.vim/plugin'
        link_folder 'vim-settings', '~/.vim/plugin/settings'
      end

      link_folder 'functions', '~/.functions' if run? 'functions'
    end
  end
end

Workstation::Install.start
