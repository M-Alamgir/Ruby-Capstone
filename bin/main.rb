#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/load_file'
require_relative '../lib/check_linters'

load_file = LoadFile.new('test/*.rb')
load_file.read_file

check = CheckLinters.new

check.trailing_space_error(load_file.file.readlines, load_file.file.seek(0))
check.space_after_comma(load_file.file.readlines, load_file.file.seek(0))
check.check_indentation(load_file.file.readlines, load_file.file.seek(0))
check.missing_braces(load_file.file.readlines, load_file.file.seek(0))
check.end_of_file(load_file.file)

if check.offenses.empty?
  puts "#{'No offenses'.colorize(:green)} detected"
else
  puts check.offenses
end
