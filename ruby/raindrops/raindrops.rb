# frozen_string_literal: true

class Raindrops
  MESSAGE = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze
  FACTOR_NUMBERS = [3, 5, 7].freeze

  def self.convert(number)
    new(number).convert
  end

  def initialize(number)
    @number = number
  end

  def convert
    if factors(@number).any? { |num| FACTOR_NUMBERS.include? num }
      factors(@number).map { |num| factor_pair(num) }.join
    else
      factors(@number).max.to_s
    end
  end

  private

  def factor_pair(number)
    MESSAGE[number]
  end

  def factors(number)
    (1..number).select { |n| (number % n).zero? }
  end
end
