#!/usr/bin/env ruby

# add ability to output to a file
# add ability to specify branch
# add ability to filter ascii
# add ability to display as %

require 'pathname'
require 'mkmf'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'tty-screen'
  gem 'terminal-table'
  gem 'byebug'
end

require 'tty-screen'
require 'terminal-table'
require 'byebug'

REQUIRED_RUBY_VERSION = Gem::Version.new('2.7.0')

if Gem::Version.new(RUBY_VERSION) < REQUIRED_RUBY_VERSION
  warn "Incompatible ruby version. At least #{REQUIRED_RUBY_VERSION} required."

  return
end

if system('git rev-parse') == 0
  warn "Directory is not a git repository. Aborting"

  return
end

unless find_executable 'git'
  warn "'git' binary not found in PATH. Aborting"

  return
end

SCREEN_OFFSET = 6
ONLY_ASCII = true

def use_less(output)
  IO.popen("less", "w") do |f|
    f.puts output
  end
end

project_dir = Pathname.new(File.expand_path('~/Repositories/sga'))
# project_dir = Pathname.new(File.expand_path('~/Repositories/practice'))
Dir.chdir(project_dir)

def print_git_project_char_count
  puts 'Calculating characters in current repository.'

  paths = `git ls-tree -r HEAD --name-only`.split
  extensions = %w[.sql .rb .js .scss .css .jsx .erb .slim]
  # extensions = %w[.rb]

  list = paths.each_with_index.inject({}) do |memo, (path, i)|
    next memo unless extensions.include?(File.extname(path))

    abs_path = File.join(Dir.pwd, path)
    tally = File.read(abs_path)
              .each_char
              .tally
              .yield_self { |tally| ONLY_ASCII ? tally.filter { |key, value| !key.gsub(/\P{ASCII}/, '').empty? } : tally }
              .compact
              .transform_keys { |k| k.inspect }

    memo.merge(tally) { |_, x, y| x + y }
  end

  total_count = list.inject(0) { |acc, (_, value)| acc + value }

  puts total_count.to_f
  list = list.sort_by { |_, value| value }.reverse.map { |(key, value)| [key, (value * 100.0 / total_count).round(2).to_s] }

  value = list.map { |pair| [pair[0].size, pair[1].to_s.size].max }.max

  # TODO work on this
  fits_times = value - (value / 2)
  puts fits_times


  sliced_list = list.each_slice(fits_times).to_a

  flattened = sliced_list.map(&:flatten)
  flattened[-1].concat(Array.new(flattened[0].size - flattened[-1].size))
  begin
    table = Terminal::Table.new rows: flattened, style: { width: TTY::Screen.width - SCREEN_OFFSET }
  rescue
    # not working
    warn "Terminal window is too narrow to fit the table. Aborting"

    return
  end

  puts table
end

print_git_project_char_count
