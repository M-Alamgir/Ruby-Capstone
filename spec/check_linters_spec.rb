require_relative '../lib/load_file'
require_relative '../lib/check_linters'
require 'colorize'

describe CheckLinters do
  let(:check) { CheckLinters.new }
  let(:load_file) { LoadFile.new('test/*.rb') }
  let(:line) { 'This is a line of string'.split('') }
  let(:new_line) { 'This is a line of'.split('') }

  describe 'Methods' do
    it 'checks if this method is returning expected value or not' do
      expect(check.trailing_space_error(line, line)).to eql(line)
    end

    it 'checks negative test case for trailing_space_error' do
      expect(check.trailing_space_error(line, line)).not_to eql(new_line)
    end

    it 'checks if this method is returning expected value or not' do
      expect(check.space_after_comma(line, line)).to eql(line)
    end

    it 'checks negative test case for space_after_comma' do
      expect(check.space_after_comma(line, line)).not_to eql(new_line)
    end

    it 'checks if this method is returning expected value or not' do
      expect(check.check_indentation(line, line)).to eql(line)
    end

    it 'checks negative test case for check_indentation' do
      expect(check.check_indentation(line, line)).not_to eql(new_line)
    end

    it 'checks if this method is returning expected value or not' do
      expect(check.missing_braces(line, line)).to eql(line)
    end

    it 'checks negative test case for missing_braces' do
      expect(check.missing_braces(line, line)).not_to eql(new_line)
    end
  end
end
