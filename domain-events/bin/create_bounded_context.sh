#!/bin/sh

bounded_context_name="$1"

mkdir -p bounded-contexts/$bounded_context_name/events
touch bounded-contexts/$bounded_context_name/README.md
echo "## $bounded_context_name" > bounded-contexts/$bounded_context_name/README.md