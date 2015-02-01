#!/usr/bin/env ruby
require 'thor'
require_relative 'workstation'

class InstallRemote < Thor::Group
  include Thor::Actions
  include Workstation

  desc 'install the remote workstation'

  def self.source_root
    File.expand_path('..', File.dirname(__FILE__))
  end

  def install
    install_ssh_pub if run? 'ssh pub'
    install_dot_files if run? 'dot files'
    install_vim_files if run? 'vim files'
    install_functions if run? 'functions'
  end

  private

  def install_ssh_pub
    machines do |m|
      cmd = "echo #{config['ssh']['pub']} > pub.key;"
      cmd << ' mkdir ~/.ssh/; mv pub.key ~/.ssh/authorized_keys;'
      ssh(m, cmd)
    end
  end

  def install_dot_files
    machines do |m|
      ssh(m, 'rm -f ~/.bashrc; rm -f ~/.aliases; rm -f ~/.bash-prompt')
      scp_to(m, 'dotfiles/bashrc', '~/.bashrc')
      scp_to(m, 'dotfiles/aliases', '~/.aliases')
      scp_to(m, 'dotfiles/bash-prompt', '~/.bash-prompt')
    end
  end

  def install_vim_files
    machines do |m|
      ssh(m, 'rm -f ~/.vimrc; rm -f ~/.vim/*; mkdir ~/.vim/plugin/settings')
      scp_to(m, 'dotfiles/vimrc', '~/.vimrc')
      scp_to(m, 'vim-setings/*', '~/.vim/plugin/settings')
    end
  end

  def install_functions
    machines do |m|
      ssh(m, 'rm -rf ~/.functions/; mkdir ~/.functions/')
      scp_to(m, 'functions/*', '~/.functions/')
    end
  end
end

Workstation::InstallRemote.start
