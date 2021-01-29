# frozen_string_literal: true

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

require 'colorize'
require_relative './load_file'

# check_linters class
class CheckLinters
  attr_accessor :no_offense, :offenses, :load_file

  def initialize
    @offenses = []
  end

  def trailing_space_error(arg0, arg1)
    arg0.each_with_index do |val, index|
      next unless val[-2] == ' ' && !val.strip.empty?

      val_size = val.size - 1
      inx = index + 1
      @offenses << "Line #{inx}:#{val_size}".colorize(:yellow) + ' Trailing Whitespace Detected'.colorize(:red)
    end
    arg1
  end

  def space_after_comma(arg0, arg1)
    arg0.each_with_index do |val, index|
      if !val.match(', ') && val.match(',')
        @offenses << "At line #{index + 1}".colorize(:yellow) + ' Space missing after comma.'.colorize(:red)
      end
    end
    arg1
  end

  def check_indentation(arg0, arg1)
    new_val = ''
    arg0.each_with_index do |val, index|
      if val[0..3].match('    ') && !new_val[0..1].match('  ')
        @offenses << "At line #{index + 1}".colorize(:yellow) + ' Use 2 (not 4) spaces for indentation.'.colorize(:red)
      end
      new_val = val
    end
    arg1
  end

  def missing_braces(arg0, arg1)
    arg0.each_with_index do |val, index|
      case val
      when /[)]/, /[(]/
        if !val.match(/[(]/) || !val.match(/[)]/)
          @offenses << "Line #{index + 1}".colorize(:yellow) + ' Missing Parentheses, unexpected token'.colorize(:red)
        end
      when /[}]/, /[{]/
        if !val.match(/[{]/) || !val.match(/[}]/)
          @offenses << "Line #{index + 1}".colorize(:yellow) + ' Missing curly braces, unexpected token'.colorize(:red)
        end
      end
    end
    arg1
  end

  def end_of_file(arg)
    @offenses << 'At the end of file: Final newline missing'.colorize(:red) unless arg.readlines.last.match(/\n/)
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
