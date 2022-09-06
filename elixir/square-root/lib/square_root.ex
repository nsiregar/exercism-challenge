defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    square_root(radicand, 1)
  end

  defp square_root(radicand, val) do
    cond do
      val > radicand        -> :error
      radicand / val == val -> val
      true                  -> square_root(radicand, val + 1)
    end
  end
end
