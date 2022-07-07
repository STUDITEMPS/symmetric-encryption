# SymmetricEncryption

Provides tooling to symmetrically encrypt/decrypt data across different programming languages.

## Supported Languages

- Ruby
- Elixir

## Installation

### Ruby

### Elixir

The package can be installed by adding `symmetric_encryption` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:symmetric_encryption, "~> 0.1", git: "https://github.com/STUDITEMPS/symmetric-encryption.git", branch: "main", sparse: ["elixir"]}
  ]
end
```

## Usage

### General

The underlying encryption algorithm is AES-256-GCM, that is the _Advanced Encryption Standard_ block cipher with _256_ bit keys in the _Galois Counter Mode_.
The biggest error anyone can do when using AES-256-GCM is to reuse an initialization vector (IV) key pair. **NEVER USE THE SAME IV TWICE!** If you reuse an IV, you might as well post your secret key on Twitter.
