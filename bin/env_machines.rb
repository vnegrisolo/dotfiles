#!/usr/bin/env ruby
require 'thor'
require 'yaml'

class EnvMachines < Thor::Group
  include Thor::Actions

  desc 'setup the environment machines'

  def self.source_root
    File.dirname(__FILE__)
  end

  def copy_ssh_pub
    return if no? "#{__method__}? [y|n]", :red
    machines(:dev, :qa) do |machine|
      system("ssh #{machine} 'echo #{config['ssh']['pub']} > teste.txt; mkdir ~/.ssh/; mv teste.txt ~/.ssh/authorized_keys'")
    end
  end

  def copy_functions
    return if no? "#{__method__}? [y|n]", :red
    machines(:dev, :qa) do |machine|
      system("ssh #{machine} 'rm -rf ~/.functions/; mkdir ~/.functions/'")
      system("scp functions/* #{machine}:~/.functions/")
    end
  end

  def copy_bashrc
    return if no? "#{__method__}? [y|n]", :red
    machines(:dev, :qa) do |machine|
      system("ssh #{machine} 'rm -f ~/.bashrc'")
      system("scp dotfiles/bashrc #{machine}:~/.bashrc")
    end
  end

  def command
    return if no? "#{__method__}? [y|n]", :red
    command = ask('Type a command:')
    say "command = #{command}", :green
    machines(:dev, :qa) do |machine|
      system("ssh #{machine} '#{command}'")
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
        say "machine = #{machine}", :blue
        yield machine[0]
      end
    end
  end

end

EnvMachines.start
