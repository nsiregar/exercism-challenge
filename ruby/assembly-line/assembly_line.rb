# frozen_string_literal: true

class AssemblyLine
  PRODUCTION_PER_HOUR = 221.to_f

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    production_rate = @speed * PRODUCTION_PER_HOUR

    case @speed
    when 1..4
      production_rate * 1.0
    when 5..8
      production_rate * 0.9
    when 9
      production_rate * 0.8
    when 10
      production_rate * 0.77
    else
      production_rate * 0
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
