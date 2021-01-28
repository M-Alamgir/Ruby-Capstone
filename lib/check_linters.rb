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
                @offenses << "At line #{index + 1}:#{val.size - 1}".colorize(:yellow)+" Trailing Whitespace Detected".colorize(:red)
            end
        end
        @load_file.file.seek(0)
    end

    def space_after_comma
        @load_file.file.readlines.each_with_index do | val, index |
            if !val.match(', ') && val.match(',')
                @offenses << "At line #{index + 1}".colorize(:yellow)+" Space missing after comma.".colorize(:red)
            end
        end
        @load_file.file.seek(0)
    end

    def check_indentation
        new_val = ''
        @load_file.file.readlines.each_with_index do | val, index |
            if val[0..3].match('    ') && !new_val[0..1].match('  ')
                @offenses << "At line #{index + 1}".colorize(:yellow)+" Use 2 (not 4) spaces for indentation.".colorize(:red)
            end
            new_val = val
        end
        @load_file.file.seek(0)
    end

    def missing_braces
        @load_file.file.readlines.each_with_index do | val, index |
            if val.match(/[)]/) || val.match(/[(]/)
                if !val.match(/[(]/) || !val.match(/[)]/)
                    @offenses << "At line #{index + 1}".colorize(:yellow)+" Missing Parentheses, unexpected token kEND".colorize(:red)
                end
            elsif val.match(/[}]/) || val.match(/[{]/)
                if !val.match(/[{]/) || !val.match(/[}]/)
                    @offenses << "At line #{index + 1}".colorize(:yellow)+" Missing curly braces, unexpected token kEND".colorize(:red)
                end
            end
        end
        @load_file.file.seek(0)
    end

    def end_of_file
        if !@load_file.file.readlines.last.match(/\n/)
            @offenses << "At the end of file: Final newline missing".colorize(:red)
        end
    end

end