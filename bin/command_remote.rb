#!/usr/bin/env ruby
require 'thor'
require_relative 'workstation'

module Workstation
  class CommandRemote < Thor::Group
    include Workstation

    desc 'running a remote command'

    def self.source_root
      File.dirname(__FILE__)
    end

    def command
      cmd = ask('Type the command:')
      machines { |m| ssh(m, cmd) }
    end
  end
end

Workstation::CommandRemote.start
