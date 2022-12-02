# frozen_string_literal: true

require 'rspec'

def parse(string)
  string.split(/\n/).map(&:to_i)
end

def load(filename)
  File.binread(filename)
end

def part1(input_as_string)
  input = parse(input_as_string)
  0
end

def part2(input_as_string)
  input = parse(input_as_string)
  0
end

describe 'advent of code X, day X' do
  it 'input can be parsed' do
    expect(parse("1\n2\n3\n")).to eq([1, 2, 3]) # change the string and change the expected result
  end

  it 'test data exists' do
    filename = "#{File.dirname(__FILE__)}/input.txt"
    expect(File.exist?(filename)).to be(true), "input file #{filename} not found"
    expect(Object.private_method_defined?(:part1)).to be(true), 'define method part1 to get started'
  end

  it 'part1 gives correct solution with test data' do
    filename = "#{File.dirname(__FILE__)}/test_input.txt"
    expect(File.exist?(filename)).to be(true), "input file #{filename} not found"
    expect(Object.private_method_defined?(:part1)).to be(true), 'define method part1 to get started'

    expect(part1(load(filename))).to eq(15)  # fill in the correct answer for test data

    # run with real data
    filename = "#{File.dirname(__FILE__)}/input.txt"
    puts '    =========== running part 1 =============='
    result = part1(load(filename))
    puts '    -----------------------------------------'
    puts "               #{result}"
    puts '    ========================================='
  end


  # rename 'skip' to 'it' to run the test, when you get startet on part 2
  skip 'part2 gives correct solution with test data' do
    filename = "#{File.dirname(__FILE__)}/test_input.txt"
    expect(File.exist?(filename)).to be(true), "input file #{filename} not found"
    expect(Object.private_method_defined?(:part2)).to be(true), 'define method part2 to get started'

    expect(part2(load(filename))).to eq(1924) # fill in the correct answer for test data

    # run with real data
    filename = "#{File.dirname(__FILE__)}/input.txt"
    puts '    =========== running part 2 =============='
    result = part2(load(filename))
    puts '    -----------------------------------------'
    puts "               #{result}"
    puts '    ========================================='
  end
end
