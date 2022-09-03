# frozen_string_literal: true

class SpaceAge
  EARTH_ORBITAL_PERIOD = 365.256 # source https://en.wikipedia.org/wiki/Earth%27s_orbit
  SECONDS_IN_A_DAY = 60 * 60 * 24
  EARTH_ORBITAL_IN_SECONDS = SECONDS_IN_A_DAY * EARTH_ORBITAL_PERIOD
  PLANET_ORBITAL_PERIODS = {
    earth: EARTH_ORBITAL_IN_SECONDS,
    mercury: EARTH_ORBITAL_IN_SECONDS * 0.2408467,
    venus: EARTH_ORBITAL_IN_SECONDS * 0.61519726,
    mars: EARTH_ORBITAL_IN_SECONDS * 1.8808158,
    jupiter: EARTH_ORBITAL_IN_SECONDS * 11.862615,
    saturn: EARTH_ORBITAL_IN_SECONDS * 29.447498,
    uranus: EARTH_ORBITAL_IN_SECONDS * 84.016846,
    neptune: EARTH_ORBITAL_IN_SECONDS * 164.79132
  }.freeze

  def initialize(seconds)
    @seconds = seconds
  end

  PLANET_ORBITAL_PERIODS.each do |planet, orbital_period|
    define_method("on_#{planet}") do
      (@seconds / orbital_period).round 2
    end
  end
end
