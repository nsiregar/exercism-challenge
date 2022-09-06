defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when length(a) == length(b) do
    case equal_begin(a, b) do
      true -> :equal
      false -> :unequal
    end
  end
  def compare(a, b) when length(a) < length(b) do
    case find_match(a, b) do
      true -> :sublist
      false -> :unequal
    end
  end
  def compare(a, b) do
    case find_match(b, a) do
      true -> :superlist
      false -> :unequal
    end
  end

  @spec find_match(list, list) :: bool
  defp find_match(a, b)
  defp find_match(a, b) when length(a) > length(b), do: false
  defp find_match(a, b) do
    case equal_begin(a, b) do
      true -> true
      false -> find_match(a, tl(b))
    end
  end

  @spec equal_begin(list, list) :: bool
  defp equal_begin(a, b)
  defp equal_begin([], _), do: true
  defp equal_begin([a|_], [b|_]) when a !== b, do: false
  defp equal_begin([_|a], [_|b]), do: equal_begin(a, b)

end
