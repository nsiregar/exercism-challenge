defmodule Raindrops do
  @message %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    number
    |> do_raindrop
  end

  defp do_raindrop(n) do
    @message
    |> Map.keys()
    |> Enum.reduce("", fn key, str -> do_find_prime_factor(key, str, n) end)
    |> do_check(n)
  end

  defp do_find_prime_factor(key, str, n) when rem(n, key) == 0 do
    str <> @message[key]
  end

  defp do_find_prime_factor(_, str, _), do: str

  defp do_check(str, n) when byte_size(str) == 0, do: Integer.to_string(n)
  defp do_check(str, _), do: str
end
