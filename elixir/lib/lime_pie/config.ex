defmodule LimePie.Config do
  use Agent

  def start_link(keys_in_string) do
    known_keys = LimePie.KeyLime.parse_multiple_keys(keys_in_string)
    Agent.start_link(fn -> known_keys end, name: __MODULE__)
  end

  def keys() do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def get_key(key_name) do
    Agent.get(__MODULE__, fn state ->
      case Map.fetch(state, key_name) do
        {:ok, value} -> {:ok, value}
        :error -> {:error, :unknown_key}
      end
    end)
  end
end
