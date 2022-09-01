# frozen_string_literal: true

class Clock
  attr_reader :minute, :hour

  def initialize(hour: nil, minute: nil)
    @hour = hour.to_i
    @minute = minute.to_i
  end

  def +(other)
    total_hour, minute_remainder = parse_clock(other)

    @hour += total_hour
    @minute += minute_remainder
    self
  end

  def -(other)
    total_hour, minute_remainder = parse_clock(other)
    @hour -= total_hour
    @minute -= minute_remainder
    self
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    total_hour, minute = parse_clock(self)
    hour = total_hour % 24

    format_hour = format('%02d', hour.to_i)
    format_minute = format('%02d', minute.to_i)

    "#{format_hour}:#{format_minute}"
  end

  private

  def parse_clock(clock)
    hours_from_minute = clock.minute / 60
    minute_remainder = clock.minute % 60
    total_hour = clock.hour + hours_from_minute
    [total_hour, minute_remainder]
  end
end
