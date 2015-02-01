#!/usr/bin/env ruby
require 'thor'
require_relative 'workstation'

class CommandRemote < Thor::Group
  include Thor::Actions
  include Workstation

  desc 'running a remote command'

  def self.source_root
    File.expand_path('..', File.dirname(__FILE__))
  end

  def command
    cmd = ask('Type the command:')
    machines { |m| ssh(m, cmd) }
  end
end

Workstation::CommandRemote.start
