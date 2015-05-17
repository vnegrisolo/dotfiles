require 'thor'
require 'yaml'

module Workstation
  include Thor::Actions

  def self.source_root
    File.expand_path('..', File.dirname(__FILE__))
  end

  def files_in(folder)
    Dir.foreach(folder) do |file|
      yield file if file != '.' && file != '..'
    end
  end

  def config
    YAML.load_file('config/env_machines.yml')
  end

  def system_command(command)
    say command, :blue
    system(command)
  end
end
