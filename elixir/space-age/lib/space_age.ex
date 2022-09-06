defmodule SpaceAge do
  @earth_orbital_period 365.25 # source https://en.wikipedia.org/wiki/Earth%27s_orbit
  @seconds_in_a_day 60 * 60 * 24
  @earth_orbital_in_seconds @earth_orbital_period * @seconds_in_a_day
  @planet_orbital_periods %{
    earth: @earth_orbital_in_seconds,
    mercury: @earth_orbital_in_seconds * 0.2408467,
    venus: @earth_orbital_in_seconds * 0.61519726,
    mars: @earth_orbital_in_seconds * 1.8808158,
    jupiter: @earth_orbital_in_seconds * 11.862615,
    saturn: @earth_orbital_in_seconds * 29.447498,
    uranus: @earth_orbital_in_seconds * 84.016846,
    neptune: @earth_orbital_in_seconds * 164.79132
  }

  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    @planet_orbital_periods
    |> Map.get(planet)
    |> case do
         nil -> {:error, "not a planet"}
         orbital_period -> {:ok, seconds / orbital_period}
       end
  end
end
