# README

LimePie is a method and tool to encrypt and decrypt sensitive information in domain events.

It consists of a theoretical part that describes
* how keys are specified
* how domain events are processed and which of their fields are en- and decrypted

and of programmed parts:
* implementations of key handling and en-/decryption in multiple Languages: Elixir, Ruby
* a test suite that actually encrypts the jobvalley domain events with one implementation and decrypts the result with another
 

 ## General

The underlying encryption algorithm is AES-256-GCM, that is the _Advanced Encryption Standard_ block cipher with _256_ bit keys in the _Galois Counter Mode_.
The biggest error anyone can do when using AES-256-GCM is to reuse an initialization vector (IV) key pair. **NEVER USE THE SAME IV TWICE!** If you reuse an IV, you might as well post your secret key on Twitter.


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
