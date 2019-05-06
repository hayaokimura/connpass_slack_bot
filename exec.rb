#! /bin/sh
exec ruby -S -x "$0" "$@"
#! ruby

require './connpass_api'

p ConnpassAPI.search(ARGV[0], ARGV[1])