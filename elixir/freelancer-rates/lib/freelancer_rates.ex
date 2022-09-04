defmodule FreelancerRates do
  @working_hour 8.0
  @working_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @working_hour
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - (discount / 100))
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(@working_days)
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget
    |> Kernel./(hourly_rate
                |> apply_discount(discount)
                |> daily_rate()
       )
    |> Float.floor(1)
  end
end
