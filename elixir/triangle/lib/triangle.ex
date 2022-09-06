defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene
  @neg_cathetus "all side lengths must be positive"
  @inv_cathetus "side lengths violate triangle inequality"

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    (&determine/3)
    |> apply(Enum.sort([a, b, c], :desc))
  end

  defp determine(a, a, a) when a > 0, do: {:ok, :equilateral}
  defp determine(_, _, e) when e <= 0, do: {:error, @neg_cathetus}
  defp determine(h, a, b) when h > a + b, do: {:error, @inv_cathetus}
  defp determine(a, a, _), do: {:ok, :isosceles}
  defp determine(_, h, h), do: {:ok, :isosceles}
  defp determine(_a, _b, _c), do: {:ok, :scalene}
end
