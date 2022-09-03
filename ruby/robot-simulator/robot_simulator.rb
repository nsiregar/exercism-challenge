# frozen_string_literal: true

class Robot
  attr_reader :bearing, :coordinates

  DIRECTIONS = %i[north east south west].freeze
  RIGHT_TURNS = {
    north: :east,
    east: :south,
    south: :west,
    west: :north
  }.freeze
  LEFT_TURNS = RIGHT_TURNS.invert.freeze

  def initialize
    @bearing = nil
    @coordinates = [0, 0]
  end

  def orient(direction)
    return @bearing = direction if DIRECTIONS.include? direction

    raise ArgumentError, "#{direction} is invalid"
  end

  def turn_right
    @bearing = RIGHT_TURNS[bearing]
  end

  def turn_left
    @bearing = LEFT_TURNS[bearing]
  end

  def at(x_pos, y_pos)
    @coordinates = [x_pos, y_pos]
  end

  def advance
    case @bearing
    when :north
      @coordinates[1] += 1
    when :south
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    when :east
      @coordinates[0] += 1
    end
  end
end

class Simulator
  COMMAND_MAP = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }.freeze

  def instructions(commands)
    commands.each_char.map { |cmd| COMMAND_MAP[cmd] }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, commands)
    instructions(commands).each { |instruction| robot.send instruction }
  end
end
