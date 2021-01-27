#!/usr/bin/env ruby

require_relative "../lib/load_file.rb"
require_relative "../lib/check_linters.rb"

check = Check_linters.new
puts check.trailing_space_error
