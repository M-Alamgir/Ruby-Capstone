# frozen_string_literal: true

require_relative '../lib/load_file'
require_relative '../lib/check_linters'
require 'colorize'

describe CheckLinters do
  let(:check) { CheckLinters.new }
  let(:load_file) { LoadFile.new('test/*.rb') }
  let(:line) { 'This is a line of string'.split('') }

  describe 'Methods' do
    it 'checks if this method is returning expected value or not' do
      expect(check.trailing_space_error(line, line)).to eql(line)
    end

    it 'checks if this method is returning expected value or not' do
      expect(check.space_after_comma(line, line)).to eql(line)
    end

    it 'checks if this method is returning expected value or not' do
      expect(check.check_indentation(line, line)).to eql(line)
    end

    it 'checks if this method is returning expected value or not' do
      expect(check.missing_braces(line, line)).to eql(line)
    end
  end
end
