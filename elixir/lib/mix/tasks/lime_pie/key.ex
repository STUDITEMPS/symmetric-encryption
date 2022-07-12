defmodule Mix.Tasks.LimePie.Key do
  @moduledoc "creates a LimePie compatible key and writes it to STDOUT"
  @shortdoc "prints out a named key"
  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    key_name = "test" <> (DateTime.utc_now() |> DateTime.to_iso8601())

    LimePie.KeyLime.new(key_name)
    |> IO.puts()
  end
end
