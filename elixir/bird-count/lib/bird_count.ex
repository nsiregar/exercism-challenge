defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([today | _tail]) do
    today
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count([today | tail]) do
    [today + 1 | tail]
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total([]) do
    0
  end

  def total([today | tail]) do
    today + total(tail)
  end

  def busy_days([]) do
    0
  end

  def busy_days([today | tail]) do
    cond do
      today >= 5 -> 1 + busy_days(tail)
      true -> busy_days(tail)
    end
  end
end
