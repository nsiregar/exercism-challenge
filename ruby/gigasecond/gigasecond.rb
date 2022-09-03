# frozen_string_literal: true

class Gigasecond
  def self.from(utc)
    utc + 1_000_000_000
  end
end
