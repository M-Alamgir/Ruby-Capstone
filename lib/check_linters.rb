require 'colorize'
require_relative "load_file.rb"

class Check_linters < Load_file
    def initialize
        @load_file = Load_file.new('test/*.rb')
        @read_file = @load_file.read_file
        @offense = []
    end

    def trailing_space_error
        @load_file.file.readlines.each_with_index do | val, index |
            if val[-2] == ' ' && !val.strip.empty?
                return "At line #{index + 1}:#{val.size - 1} Trailing Whitespace Detected".colorize(:red)
            end
        end
    end
end