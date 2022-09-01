# frozen_string_literal: true

class Year
  def self.leap?(year)
    new(year).leap?
  end

  def initialize(year)
    @year = year
  end

  def leap?
    return true if (@year % 4).zero? && !((@year % 100).zero? && !(@year % 400).zero?)

    false
  end
end
