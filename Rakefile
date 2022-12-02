# frozen_string_literal: true

require 'dotenv'
require 'date'
require 'fileutils'
require 'mechanize'

YEAR = '2022'

def save_input(day)
  Dotenv.load

  agent = Mechanize.new
  agent.pluggable_parser.default = Mechanize::Download

  cookie = Mechanize::Cookie.new(
    domain: '.adventofcode.com',
    name: 'session',
    value: ENV['AOC_SESSION_KEY'],
    secure: true,
    httponly: true,
    path: '/',
    expires: (Date.today + 24).to_s
  )
  agent.cookie_jar << cookie
  url = "https://adventofcode.com/#{YEAR}/day/#{day}/input"
  filename = format('%02d/input.txt', day)

  File.unlink(filename) if File.exist?(filename)
  agent.get(url).save(filename)
end

def set_guard(day)
  dirname = format('%02d', day)
  guardfile = File.read('Guardfile')
  guardfile.sub!(/todays_dir = '\d+'/, "todays_dir = '#{dirname}'")
  File.open('Guardfile', 'w') do |f|
    f.puts guardfile
  end
  puts 'now run bundle exec guard'
end

def get_title(day)
  Dotenv.load
  puts "using cookie #{ENV['AOC_SESSION_KEY']}"

  agent = Mechanize.new
  page = agent.get("https://adventofcode.com/#{YEAR}/day/#{day}")
  title = page.parser.css('h2').text
  title = title.sub(/^.*: /, '').sub(' ---', '')
  puts "Today: #{title}"
  title
end

def code_dir(day)
  dirname = format('%02d', day)
  FileUtils.mkdir_p(dirname)
  Dir.glob('template/*').each do |source_file|
    filename = File.basename(source_file)
    target_file = "#{dirname}/#{filename}"
    # FileUtils.cp(source_file, target_file)
    next if File.exist?(target_file)

    content = File.read(source_file)
    content.sub!(/advent of code X, day X/, "advent of code #{YEAR}, day #{day}")
    File.open(target_file, 'w') do |f|
      f.puts content
    end
  end

  FileUtils.touch "#{dirname}/input.txt"
  FileUtils.touch "#{dirname}/test_input.txt"
end

task :default do
  puts 'usage: '
  puts '  rake next      # sets up everything for today'
  puts '  rake day[3]    # sets up everything for day 3'
  puts '  rake input[3]  # gets input data for day 3'
  puts '  rake guard[3]  # sets up Guardfile to run day 3'
end

task :next do
  today = Date.today
  day = today.day
  if today.month < 12
    puts "Advent of Code starts in #{12 - today.month} months."
    exit
  end
  code_dir(day)
  save_input(day)
  set_guard(day)
end

task :day, [:date] do |_t, args|
  day = args.date.to_i
  puts "Should work on day #{day}"
  code_dir(day)
  set_guard(day)
end

task :input, [:date] do |_t, args|
  day = args.date.to_i
  puts "Save input for Day #{day}"
  save_input(day)
end

task :guard, [:date] do |_t, args|
  day = args.date.to_i
  puts "Set Guardfile to day #{day}"
  set_guard(day)
end
