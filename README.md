# Use Ruby and Testing for Advent of Code 2022

Test Driven coding for advent of code

Code is in `01/solution_spec.rb` to `25/solution_spec.rb`


## Setup (once)

Edit Rakefile line 8: set the correct year

Log into your account on https://adventofcode.com/
and read out the session-cookie  (using the developer tools
in your webbrowser. e.g. tab web-storage in Firefox developer tools)

create a file `.env` in the main folder:

    AOC_SESSION_KEY=12345verylongstring12345

## Setup (daily)

To set up for today, run two commands in the terminal:

    rake next          # sets up everything for today
    bundle exec guard  # watches for changes in todays program, runs tests after edit

now the terminal is busy, the rest happens in the editor:

## Part 0: Test data and parsing

* read todays riddle, copy todays test-data into `test_input.txt`
* now the test "test data exists" should go green
* edit line 39 in `solution_spec.rb`: fill in the correct result for todays test
* edit line 25 in `solution_spec.rb`: give todays input, and how it should be parsed
* now the test "input can be parsed" should go green

## Part 1: solve the first part of the riddle

* implement `part1` in `solution_spec.rb`
* now the test "part1 gives correct solution with test data" should go green
* copy out the result for part1

## Part 2: solve the second part of the riddle

* read the second part of todays riddle
* find the line skip 'part2 gives correct solution with test data',
* change the workd "skip" to "it"
* now the test "part1 gives correct solution with test data" should be red
* implement `part2` in `solution_spec.rb`
* now the test "part2 gives correct solution with test data" should go green
* copy out the result for part2

## Finish for the day

* type EXIT and press ENTER to stop guard in the terminal
* don't forget to commit todays solution!


## more setup options

you can also use rake to generate other days:

    rake next      # sets up everything for today
    rake day[3]    # sets up everything for day 3
    rake input[3]  # gets input data for day 3
    rake guard[3]  # sets up Guardfile to run day 3

