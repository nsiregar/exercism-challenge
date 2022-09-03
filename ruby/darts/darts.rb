# frozen_string_literal: true

class Darts
  def initialize(point_x, point_y)
    @distance = Math.sqrt(point_x**2 + point_y**2)
  end

  def score
    case @distance
    when 0..1
      10
    when 1..5
      5
    when 5..10
      1
    else
      0
    end
  end
end
