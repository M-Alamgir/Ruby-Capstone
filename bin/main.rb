#!/usr/bin/env ruby

require_relative "../lib/load_file.rb"
require_relative "../lib/check_linters.rb"

check = Check_linters.new
check.trailing_space_error
check.space_after_comma
check.check_indentation
check.missing_braces
check.end_of_file

if check.offenses.empty?
    puts 'No offenses'.colorize(:green) + ' detected'
else
    puts check.offenses
end