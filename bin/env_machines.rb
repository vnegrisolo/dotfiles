#!/usr/bin/env ruby
require 'thor'
require 'pry'
require 'yaml'

class EnvMachines < Thor::Group
  include Thor::Actions

  desc 'setup the environment machines'

  def self.source_root
    File.dirname(__FILE__)
  end

  def copy_ssh_pub
    return if no? "copy all the ssh pub? [y|n]", :red
    machines(:dev, :qa) do |machine|
      say "copy ssh pub to #{machine}", :blue
      system("ssh #{machine} 'echo #{config['ssh']['pub']} > teste.txt; mkdir ~/.ssh/; mv teste.txt ~/.ssh/authorized_keys'")
    end
  end

  def copy_functions
    return if no? "copy all the functions? [y|n]", :red
    machines(:dev, :qa) do |machine|
      say "copy functions to #{machine}", :blue
      system("ssh #{machine} 'mkdir ~/.functions/'")
      system("scp functions/* #{machine}:~/.functions/")
    end
  end

  def copy_bashrc
    return if no? "copy all the bashrc? [y|n]", :red
    machines(:dev, :qa) do |machine|
      say "copy bashrc to #{machine}", :blue
      system("scp dotfiles/bashrc #{machine}:~/.bashrc")
    end
  end

  private

  def config
    YAML.load_file('config/env_machines.yml')
  end

  def machines(*envs)
    envs.each do |env|
      say "iterate over env #{env}", :yellow
      config['servers'][env.to_s].each do |machine|
        yield machine[0]
      end
    end
  end

end

EnvMachines.start
