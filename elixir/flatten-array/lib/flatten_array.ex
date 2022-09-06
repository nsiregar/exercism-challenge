defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    flatten_list(list)
  end

  defp flatten_list([]), do: []
  defp flatten_list(nil), do: []
  defp flatten_list([h | t]), do: flatten(h) ++ flatten(t)
  defp flatten_list(h), do: [h]
end
