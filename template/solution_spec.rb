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
  let(:input) { load("#{File.dirname(__FILE__)}/input.txt") }
  let(:test_input) { load("#{File.dirname(__FILE__)}/test_input.txt") }

  it 'input can be parsed' do
    expect(parse("1\n2\n3\n")).to eq([1, 2, 3]) # change the string and change the expected result
  end

  it 'part1 gives correct solution with test data' do
    expect(part1(test_input)).to eq(15)  # fill in the correct answer for test data

    # run with real data
    puts '    =========== running part 1 =============='
    result = part1(input)
    puts '    -----------------------------------------'
    puts "               #{result}"
    puts '    ========================================='
  end


  # rename 'skip' to 'it' to run the test, when you get startet on part 2
  skip 'part2 gives correct solution with test data' do
    expect(part2(test_input)).to eq(1924) # fill in the correct answer for test data

    # run with real data
    puts '    =========== running part 2 =============='
    result = part2(input)
    puts '    -----------------------------------------'
    puts "               #{result}"
    puts '    ========================================='
  end
end
