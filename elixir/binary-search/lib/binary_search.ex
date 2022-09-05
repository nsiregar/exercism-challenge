defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key) do
    case do_binary_search(numbers, key, 0, tuple_size(numbers) - 1) do
      -1 -> :not_found
      index -> {:ok, index}
    end
  end

  defp do_binary_search(_numbers, _key, first, last) when first > last, do: -1
  defp do_binary_search(numbers, key, first, last) do
    middle = div(first + last, 2)
    cond do
      elem(numbers, middle) == key -> middle
      elem(numbers, middle) > key -> do_binary_search(numbers, key, first, middle - 1)
      elem(numbers, middle) < key -> do_binary_search(numbers, key, middle + 1, last)
    end
  end
end
