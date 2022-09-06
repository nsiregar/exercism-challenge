defmodule TakeANumber do
  def start() do
    spawn(fn -> take_a_number(0) end)
  end

  defp take_a_number(state) do
    new_state =
      receive do
        {:report_state, sender_pid} ->
          send(sender_pid, state)
          state
        {:take_a_number, sender_pid} ->
          send(sender_pid, state + 1)
          state + 1
        :stop ->
          nil
        _msg ->
          state
      end
    if new_state, do: take_a_number(new_state)
  end
end
