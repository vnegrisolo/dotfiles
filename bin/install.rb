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
    install_dot_files if run? 'dot files'
    install_vim_files if run? 'vim files'
    install_secrets if run? 'secrets'
  end

  private

  def install_dot_files
    files_in('dotfiles/') do |file|
      link_file "dotfiles/#{file}", "~/.#{file}"
    end
  end

  def install_vim_files
    empty_directory '~/.vim/plugin'
    link_file 'vim-settings', '~/.vim/plugin/settings'
  end

  def install_secrets
    @secrets = config['secrets']
    template('templates/secrets.erb', '~/.env-vars.secrets')
  end
end

Install.start
