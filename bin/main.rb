#!/usr/bin/env ruby

require_relative '../lib/load_file'
require_relative '../lib/check_linters'

load_file = LoadFile.new('test/*.rb')

check = CheckLinters.new

check.trailing_space_error(load_file.read_file.readlines, load_file.read_file.seek(0))
check.space_after_comma(load_file.read_file.readlines, load_file.read_file.seek(0))
check.check_indentation(load_file.read_file.readlines, load_file.read_file.seek(0))
check.missing_braces(load_file.read_file.readlines, load_file.read_file.seek(0))
check.end_of_file(load_file.read_file)

if check.offenses.empty?
  puts "#{'No offenses'.colorize(:green)} detected"
else
  puts check.offenses
end
