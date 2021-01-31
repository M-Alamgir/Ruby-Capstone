require 'colorize'
require_relative './load_file'

# check_linters class
class CheckLinters
  attr_reader :offenses

  def initialize
    @offenses = []
  end

  def error(err)
    err.colorize(:red)
  end

  def trailing_space_error(arg0, arg1)
    arg0.each_with_index do |val, index|
      next unless val[-2] == ' ' && !val.strip.empty?

      val_size = val.size - 1
      inx = index + 1
      @offenses << "Line #{inx}:#{val_size}".colorize(:yellow) + error(' Trailing Whitespace Detected')
    end
    arg1
  end

  def space_after_comma(arg0, arg1)
    arg0.each_with_index do |val, index|
      if !val.match(', ') && val.match(',')
        @offenses << "At line #{index + 1}".colorize(:yellow) + error(' Space missing after comma.')
      end
    end
    arg1
  end

  def check_indentation(arg0, arg1)
    new_val = ''
    arg0.each_with_index do |val, index|
      if val[0..3].match('    ') && !new_val[0..1].match('  ')
        @offenses << "At line #{index + 1}".colorize(:yellow) + error(' Use 2 (not 4) spaces for indentation.')
      end
      new_val = val
    end
    arg1
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity

  def missing_braces(arg0, arg1)
    arg0.each_with_index do |val, index|
      case val
      when /[)]/, /[(]/
        if !val.match(/[(]/)
          @offenses << "Line #{index + 1}".colorize(:yellow) + error(' Missing opening Parentheses, unexpected token')
        elsif !val.match(/[)]/)
          @offenses << "Line #{index + 1}".colorize(:yellow) + error(' Missing closing Parentheses, unexpected token')
        end
      when /[}]/, /[{]/
        if !val.match(/[{]/)
          @offenses << "Line #{index + 1}".colorize(:yellow) + error(' Missing opening curly brace, unexpected token')
        elsif !val.match(/[}]/)
          @offenses << "Line #{index + 1}".colorize(:yellow) + error(' Missing closing curly brace, unexpected token')
        end
      end
    end
    arg1
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  def end_of_file(arg)
    @offenses << error('At the end of file: Final newline missing') unless arg.readlines.last.match(/\n/)
  end
end
