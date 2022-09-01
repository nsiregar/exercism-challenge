# frozen_string_literal: true

class Raindrops
  MSG = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(number)
    if factors(number).any? { |number| [3, 5, 7].include? number }
      factors(number).map { |number| factor_pair(number) }.join
    else
      factors(number).max.to_s
    end
  end

  def self.factor_pair(number)
    MSG[number]
  end

  def self.factors(number)
    (1..number).select { |n| (number % n).zero? }
  end
end

module BookKeeping
  VERSION = 3
end
