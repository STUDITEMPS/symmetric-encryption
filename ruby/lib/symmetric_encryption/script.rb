# frozen_string_literal: true

require "json"
require_relative "../symmetric_encryption"

def get_key(args)
  key_index = args.index { |arg| arg == "--key" }

  if key_index.nil?
    puts "USAGE: Provide an encryption key (--key <KEY>)"
    exit
  end
  args[key_index + 1]
end

def encode(args, key)
  encode_index = args.index { |arg| ["--encode", "--encrypt"].include?(arg) }
  return if encode_index.nil?

  event_or_path = args[(encode_index || decode_index) + 1]

  if event_or_path.nil?
    puts "No path for domain_event file given (Usage: --encrypt <PATH/TO/FILE.json>)"
    exit
  end

  domain_event = read_event_or_path(event_or_path)

  event = SymmetricEncryption::DomainEvent.encrypt_domain_event(domain_event, key)
  puts event.to_json
  exit
end

def decode(args, key)
  decode_index = args.index { |arg| ["--decode", "--decrypt"].include?(arg) }
  return if decode_index.nil?

  event_or_path = args[decode_index + 1]
  if event_or_path.nil?
    puts "No domain event to decode given (Usage: --decrypt <DOMAIN_EVENT_AS_JSON>)"
    exit
  end

  domain_event = read_event_or_path(event_or_path)

  event = SymmetricEncryption::DomainEvent.decrypt_domain_event(domain_event, [key])
  puts event.to_json
  exit
end

def read_event_or_path(event_or_path)
  JSON(File.read(event_or_path))
rescue Errno::ENOENT, Errno::ENAMETOOLONG
  JSON(event_or_path)
end

def run(args)
  key = get_key(args)

  encode(args, key)
  decode(args, key)
end

run(ARGV)
