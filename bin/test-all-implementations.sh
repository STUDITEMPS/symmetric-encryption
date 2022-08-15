#!/bin/sh
set -x 
set -e
( cd elixir ; mix test )
( cd ruby ; rake test )
