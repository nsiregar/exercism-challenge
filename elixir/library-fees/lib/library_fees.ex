defmodule LibraryFees do
  @noon 12
  @due_date_delta_if_before_noon 28
  @due_date_delta_if_after_noon 29
  @monday 1

  def datetime_from_string(string) do
    {:ok, dt} = NaiveDateTime.from_iso8601(string)
    dt
  end

  def before_noon?(datetime) do
    datetime.hour < @noon
  end

  def return_date(checkout_datetime) do
    delta =
      cond do
        before_noon?(checkout_datetime) -> @due_date_delta_if_before_noon
        true -> @due_date_delta_if_after_noon
      end

    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(delta)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case actual_return_datetime |> NaiveDateTime.to_date() |> Date.diff(planned_return_date) do
      diff when diff <= 0 -> 0
      diff -> diff
    end
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(@monday)
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_dt = datetime_from_string(checkout)
    return_dt = datetime_from_string(return)

    fee =
      checkout_dt
      |> return_date()
      |> days_late(return_dt)
      |> Kernel.*(rate)

    cond do
      monday?(return_dt) -> trunc(fee / 2)
      true -> fee
    end
  end
end
