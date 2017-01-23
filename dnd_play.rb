#!/usr/bin/env ruby

require 'rubygems'
require 'commander'

class MyApplication
  include Commander::Methods
  # include whatever modules you need

  def run
    program :name, 'dnd'
    program :version, '0.0.1'
    program :description, 'CLI to help manage a game of dnd from a PC'

    command :create do |c|
      c.syntax = 'dnd create [options]'
      c.summary = ''
      c.description = ''
      c.example 'description', 'command example'
      # c.option '--combat', 'Create a combat encounter'
      c.action do |args, options|
        # Do something or c.when_called Dnd::Commands::Create
      end
    end

    run!
  end
end

MyApplication.new.run if $0 == __FILE__
