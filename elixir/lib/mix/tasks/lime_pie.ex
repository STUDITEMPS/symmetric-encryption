defmodule Mix.Tasks.LimePie do
  @moduledoc "encodes and decodes a domain event taken from the given file"
  @shortdoc "does this thing"
  use Mix.Task

  @impl Mix.Task
  def run(args) do
    {parsed, args, errors} =
      OptionParser.parse(args,
        strict: [key: :string, output: :string, encode: :boolean, decode: :boolean]
      )

    if errors != [] do
      Mix.shell().error("There were errors: " <> inspect(errors))
      Kernel.exit(1)
    end

    with {:ok, key_lime} <- get_key_lime(parsed),
         {:ok, operation} <- get_operation(parsed),
         {:ok, output} <- get_output(parsed),
         {:ok, filename} <- get_file_name(args),
         {:ok, raw_content} <- filename |> File.read(),
         {:ok, event} <- raw_content |> Jason.decode(),
         {:ok, converted_event} <-
           convert_event(event, operation, key_lime) do
      IO.write(output, converted_event |> Jason.encode!(pretty: true))
    else
      whatever ->
        Mix.shell().error("Error: " <> inspect(whatever))
        Kernel.exit(1)
    end
  end

  @spec get_key_lime(keyword()) :: {:ok, LimePie.KeyLime.t()} | {:error, atom}
  def get_key_lime(parsed) do
    if parsed[:key] do
      LimePie.KeyLime.parse(parsed[:key])
    else
      {:ok, LimePie.KeyLime.new("some_key")}
    end
  end

  @spec get_operation(keyword()) :: {:ok, :encode | :decode} | {:error, binary}
  def get_operation(parsed) do
    cond do
      Keyword.get(parsed, :decode) -> {:ok, :decode}
      Keyword.get(parsed, :encode) -> {:ok, :encode}
      true -> {:error, "option --operation is required"}
    end
  end

  @spec get_output(keyword()) :: {:ok, File.io_device()} | {:error, File.posix()} | {:ok, :stdio}
  def get_output(parsed) do
    case Keyword.get(parsed, :output, nil) do
      nil -> {:ok, :stdio}
      output_filename -> File.open(output_filename, [:write])
    end
  end

  @spec get_file_name([binary]) :: {:error, binary} | {:ok, binary}
  def get_file_name([]), do: {:error, "You must specify an input file"}

  def get_file_name([filename]) do
    if File.exists?(filename) do
      {:ok, filename}
    else
      {:error, "you must specify an input file, this one is not a file: #{filename}"}
    end
  end

  def get_file_name(_list_of_args) do
    {:error, "You can specify only one input file"}
  end

  @spec convert_event(map, :encode | :decode, LimePie.KeyLime.t()) :: {:ok, map} | {:error, atom}
  def(convert_event(event, :encode, key_lime)) do
    LimePie.encrypt_domain_event(event, key_lime)
  end

  def convert_event(event, :decode, key_lime) do
    LimePie.decrypt_domain_event(event, %{key_lime.name => key_lime})
  end
end
