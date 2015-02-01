require 'thor'
require 'yaml'

module Workstation
  include Thor::Actions

  def self.source_root
    File.expand_path('..', File.dirname(__FILE__))
  end

  def run?(method)
    yes? "#{method}? [y|n]", :red
  end

  def files_in(folder)
    Dir.foreach(folder) do |file|
      yield file if file != '.' && file != '..'
    end
  end

  def config
    YAML.load_file('config/env_machines.yml')
  end

  def machines
    [:prod].each do |env|
      say "iterate over env #{env}", :yellow
      config['servers'][env.to_s].each do |machine|
        say "machine = #{machine}", :blue
        yield machine[0]
      end
    end
  end

  def ssh(machine, command)
    system_command "ssh #{machine} '#{command}'"
  end

  def scp_from(machine, local = '.', remote = '~/*')
    system_command "scp #{machine}:#{remote} #{local}"
  end

  def scp_to(machine, local = '*', remote = '~/.')
    system_command "scp #{local} #{machine}:#{remote}"
  end

  def system_command(command)
    say command, :blue
    system(command)
  end
end
