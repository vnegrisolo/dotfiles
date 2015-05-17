#!/usr/bin/env ruby
require 'thor'
require_relative 'workstation'

class Install < Thor::Group
  include Thor::Actions
  include Workstation

  desc 'install the workstation'

  def self.source_root
    File.expand_path('..', File.dirname(__FILE__))
  end

  def install
    files_in('dotfiles/') do |file|
      link_file "dotfiles/#{file}", "~/.#{file}"
    end

    empty_directory '~/.vim/plugin'
    link_file 'vim-settings', '~/.vim/plugin/settings'

    @secrets = config['secrets']
    template('templates/secrets.erb', '~/.env-vars.secrets')
  end
end

Install.start
