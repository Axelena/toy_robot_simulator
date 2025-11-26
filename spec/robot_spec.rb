require 'rspec'
require 'spec_helper'
require './lib/robot'

describe Robot do
  describe '#initialize' do
    it 'has no coordinates and vector before placing' do
      table = Table.new
      robot = Robot.new(table)
      expect(robot.vector).to be_nil
      expect(robot.x_position).to be_nil 
      expect(robot.y_position).to be_nil 
      expect(robot.placed?).to eq false
    end
  end

  describe '#place' do
    it 'has coordinates and vector set if they are correct' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(1, 1, "NORTH")
      expect(robot.x_position).to eq 1
      expect(robot.y_position).to eq 1
      expect(robot.vector).to eq "NORTH"
      expect(robot.placed?).to eq true
    end

    it 'has no coordinates and vector set if x coorninate is incorrect' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(6, 1, "NORTH")
      expect(robot.vector).to be_nil
      expect(robot.x_position).to be_nil 
      expect(robot.y_position).to be_nil
      expect(robot.placed?).to eq false
    end

    it 'has no coordinates and vector set if y coorninate is incorrect' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(0, -7, "WECT")
      expect(robot.vector).to be_nil
      expect(robot.x_position).to be_nil 
      expect(robot.y_position).to be_nil
      expect(robot.placed?).to eq false
    end

    it 'has no coordinates and vector set if vectoris incorrect' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(4, 1, "Blah")
      expect(robot.vector).to be_nil
      expect(robot.x_position).to be_nil 
      expect(robot.y_position).to be_nil

      expect(robot.placed?).to eq false
    end
  end

  describe '#left' do
    it 'changes vector and does not change coordinates' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(1, 1, "NORTH")
      robot.left
      expect(robot.vector).to eq "WEST"
      expect(robot.x_position).to eq 1
      expect(robot.y_position).to eq 1
    end
  end

  describe '#right' do
    it 'changes vector and does not change coordinates' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(1, 1, "NORTH")
      robot.right
      expect(robot.vector).to eq "EAST"
      expect(robot.x_position).to eq 1
      expect(robot.y_position).to eq 1
    end
  end

  describe '#move' do
    it 'changes coordinate if robot has not reach table border' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(1, 1, "NORTH")
      robot.move
      expect(robot.y_position).to eq 2
    end

    it 'does not changes coordinate if robot reached table border' do
      table = Table.new
      robot = Robot.new(table)
      robot.place(1, 4, "NORTH")
      robot.move
      expect(robot.y_position).to eq 4
    end
  end
end