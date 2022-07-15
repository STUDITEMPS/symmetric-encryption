# README

LimePie is a method and tool to encrypt and decrypt sensitive information in domain events.

It consists of a theoretical part that describes
* how keys are specified
* how domain events are processed and which of their fields are en- and decrypted

and of programmed parts:
* implementations of key handling and en-/decryption in multiple Languages: Elixir, Ruby
* a test suite that actually encrypts the jobvalley domain events with one implementation and decrypts the result with another

## Elixir implementation

### adding the library to your app

Add the package by adding the following to your `deps()` in `mix.exs`:

```
  {
    :lime_pie,
    "~> 0.1",
    git: "https://github.com/STUDITEMPS/symmetric-encryption.git",
    sparse: "elixir",
    branch: "main"
  }
```

Add the following to your `config/runtime.exs` to provide the configured keys from your system environment:

```
config :your_app_name_here,
       LimePie,
       System.get_env("LIME_PIE_KEYS", "")
```

And start the key cache at startup in your `application.ex`:

```
  def start(_type, _args) do
    children =
      [
        ...
        {LimePie.Config, Application.get_env(:your_app_name_here, LimePie)}
      ] ++ environment_specific_children(Mix.env())

    Supervisor.start_link(children, your_opts)
  end

``` 

## Test suite

### converting all files with all implemtation combinations

```
# pending, not implemented yet
bin/convert_all_domain_events_with_all_encoders_and_decoders
```

### converting a single file

Example:

```
bin/convert --encoder elixir \
            --decoder elixir \
domain-events/bounded-contexts/freigabe/events/arbeitszeit-abgelehnt/event-specs/default.json
```
