# frozen_string_literal: true

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(end_number)
    (1...end_number).select do |num|
      @numbers.any? { |factor| (num % factor).zero? }
    end.sum
  end
end
