defmodule LimePie.Config do
  @moduledoc """
  An Agent to hold the information of the configured LimePie Keys
  """
  use Agent

  alias LimePie.KeyLime

  @type key_or_error :: {:ok, KeyLime.t()} | {:error, atom}

  @spec start_link(Keyword.t() | nil) :: Agent.on_start()
  def start_link(config) when is_list(config) do
    keys = config |> Keyword.get(:keys, "") |> KeyLime.parse_multiple_keys()
    encryption_key_name = config |> Keyword.get(:encryption_key_name, "")

    state = %{
      keys: keys,
      encryption_key_name: encryption_key_name
    }

    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def start_link(nil), do: start_link([])

  @spec keys() :: %{optional(binary) => KeyLime.t() | {:error, atom}}
  def keys() do
    Agent.get(__MODULE__, fn state -> state.keys end)
  end

  @spec key(binary) :: key_or_error
  def key(key_name) do
    Agent.get(__MODULE__, fn state -> key_or_error(state.keys, key_name) end)
  end

  @spec encryption_key() :: key_or_error
  def encryption_key() do
    Agent.get(__MODULE__, fn
      %{encryption_key_name: nil} -> {:error, :no_encyption_key_configured}
      state -> state.keys |> key_or_error(state.encryption_key_name)
    end)
  end

  @spec key_or_error(%{optional(binary) => KeyLime.t()}, binary) :: key_or_error
  defp key_or_error({:error, _}, _), do: {:error, :no_keys_configured}

  defp key_or_error(keys, key_name) do
    with {:ok, value} <- Map.fetch(keys, key_name),
         %KeyLime{} = key <- value do
      {:ok, key}
    else
      {:error, atom} -> {:error, atom}
      :error -> {:error, :unknown_key}
    end
  end
end
