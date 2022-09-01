# frozen_string_literal: true

class Lasagna
  ZERO_MINUTES = 0
  EXPECTED_MINUTES_IN_OVEN = 40
  MINUTES_IN_LAYER = 2

  def remaining_minutes_in_oven(actual_minutes_in_oven)
    return ZERO_MINUTES if actual_minutes_in_oven > EXPECTED_MINUTES_IN_OVEN || actual_minutes_in_oven < ZERO_MINUTES

    EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end

  def preparation_time_in_minutes(layers)
    return ZERO_MINUTES if layers.negative?

    layers * MINUTES_IN_LAYER
  end

  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    actual_minutes_in_oven = actual_minutes_in_oven.negative? ? 0 : actual_minutes_in_oven

    preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
  end
end
