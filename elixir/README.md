# LimePie
## adding the library to your app

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
       keys: System.get_env("LIME_PIE_KEYS", ""),
       encryption_key_name: System.get_env("LIME_PIE_ENCRYPTION_KEY_NAME")

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


