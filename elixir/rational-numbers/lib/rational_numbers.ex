defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2} |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2} |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2} |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, a2 * b1} |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)} |> reduce
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a1, b1}, n) when n >= 0 do
    reduce({Integer.pow(a1, n), Integer.pow(b1, n)})
  end

  def pow_rational({a1, b1}, n) do
    reduce({Integer.pow(b1, Kernel.abs(n)), Integer.pow(a1, Kernel.abs(n))})
  end


  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    Float.pow(x / 1, a / 1)
    |> Float.pow(1 / b)
  end


  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({0, _}), do: {0, 1}
  def reduce({a, b}) when b < 0 do
    gcd = Integer.gcd(a, b)
    {Kernel.trunc(-a / gcd), Kernel.trunc(-b / gcd)}
  end

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    {Kernel.trunc(a / gcd), Kernel.trunc(b / gcd)}
  end
end
