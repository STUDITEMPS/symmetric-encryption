#!/bin/sh

bounded_context_name="$1"
event_name="$2"

mkdir -p bounded-contexts/$bounded_context_name/events/$event_name/event-specs
touch bounded-contexts/$bounded_context_name/events/$event_name/event-specs/default.json
touch bounded-contexts/$bounded_context_name/events/$event_name/README.md
