require 'colorize'
require_relative "load_file.rb"

class Check_linters < Load_file
    attr_accessor :no_offense, :offenses
    def initialize
        @load_file = Load_file.new('test/*.rb')
        @read_file = @load_file.read_file
        @offenses = []
    end

    def trailing_space_error
        @load_file.file.readlines.each_with_index do | val, index |
            if val[-2] == ' ' && !val.strip.empty?
                @offenses << "At line #{index + 1}:#{val.size - 1} Trailing Whitespace Detected".colorize(:red)
            end
        end
        @load_file.file.seek(0)
    end

    def space_after_comma

        @load_file.file.readlines.each_with_index do | val, index |
            if val.include?(',') && !val.include?(', ')
                @offenses << "At line #{index + 1}:#{val.size - 1} Space missing after comma.".colorize(:red)
            end
        end
    end

end