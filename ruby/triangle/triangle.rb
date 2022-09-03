# frozen_string_literal: true

class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    triangle? && num_of_sides == 1
  end

  def isosceles?
    triangle? && num_of_sides <= 2
  end

  def scalene?
    triangle? && num_of_sides == 3
  end

  def triangle?
    @sides.all?(&:positive?) &&
      @sides.permutation(3).all? { |(a, b, c)| a <= b + c }
  end

  private

  def num_of_sides
    @sides.uniq.count
  end
end
