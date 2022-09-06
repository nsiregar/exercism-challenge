defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  defp count([], acc) do
    acc
  end

  defp count([_ | t], acc) do
    count(t, acc + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  defp reverse([], acc) do
    acc
  end

  defp reverse([h | t], acc) do
    reverse(t, [h | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, [])
  end

  defp map([], _, acc) do
    reverse(acc)
  end

  defp map([h | t], f, acc) do
    map(t, f, [f.(h) | acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  defp filter([], _, acc) do
    reverse(acc)
  end

  defp filter([h | t], f, acc) do
    cond do
      f.(h) -> filter(t, f, [h | acc])
      true -> filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _) do
    acc
  end

  def foldl([h | t], acc, f) do
    foldl(t, f.(h, acc), f)
  end

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f) do
    l
    |> reverse()
    |> foldl(acc, f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    a
    |> reverse()
    |> list_append(b)
  end

  defp list_append([], b) do
    b
  end

  defp list_append([h | t], b) do
    list_append(t, [h | b])
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    foldr(ll, [], &append(&1, &2))
  end
end
