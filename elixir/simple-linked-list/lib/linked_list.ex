defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list) do
    do_count(list, 0)
  end

  defp do_count({}, acc) do
    acc
  end
  defp do_count({_, next}, acc) do
    do_count(next, acc + 1)
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?({}) do
    true
  end
  def empty?({_, _}) do
    false
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({}) do
    {:error, :empty_list}
  end
  def peek({head , _}) do
    {:ok, head}
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({}) do
    {:error, :empty_list}
  end
  def tail({_, next}) do
    {:ok, next}
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({}) do
    {:error, :empty_list}
  end
  def pop({head , tail}) do
    {:ok, head, tail}
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    reverse(do_from_list(list, {}))
  end

  defp do_from_list([], acc) do
    acc
  end
  defp do_from_list([h|t], acc) do
    do_from_list(t, {h, acc})
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    do_to_list(reverse(list), [])
  end

  defp do_to_list({}, acc) do
    acc
  end
  defp do_to_list({head, tail}, acc) do
    do_to_list(tail, [head | acc])
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    do_reverse(list, {})
  end

  defp do_reverse({}, acc) do
    acc
  end
  defp do_reverse({head, next}, acc) do
    do_reverse(next, {head, acc})
  end
end
