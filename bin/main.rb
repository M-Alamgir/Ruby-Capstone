#!/usr/bin/env ruby

require_relative "../lib/load_file.rb"
require_relative "../lib/check_linters.rb"

load_file = Load_file.new('test/*.rb')

load_file.read_file
