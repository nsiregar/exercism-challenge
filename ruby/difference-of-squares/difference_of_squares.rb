# frozen_string_literal: true

class Squares
  def initialize(size)
    @numbers = 1.upto size
  end

  def square_of_sum
    @numbers.sum**2
  end

  def sum_of_squares
    @numbers.map { |n| n**2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
