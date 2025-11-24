#!/usr/bin/env ruby

require_relative 'lib/robot'
require_relative 'lib/table'
require_relative 'lib/command_processor'

table = Table.new
robot = Robot.new(table)
command_processor = CommandProcessor.new(robot, table)

# this additional helping console messages can be removed/commented
puts "Start with PLACE command"

ARGF.each_line { |line| 
  command_processor.process(line.strip)	 
}