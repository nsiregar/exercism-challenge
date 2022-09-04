defmodule Secrets do
  def secret_add(secret) do
    fn params -> params + secret end
  end

  def secret_subtract(secret) do
    fn params -> params - secret end
  end

  def secret_multiply(secret) do
    fn params -> params * secret end
  end

  def secret_divide(secret) do
    fn params -> trunc(params / secret) end
  end

  def secret_and(secret) do
    fn params -> Bitwise.&&&(params, secret) end
  end

  def secret_xor(secret) do
    fn params -> Bitwise.^^^(params, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn(params) ->
      secret_function2.(
        secret_function1.(params)
      )
    end
  end
end
