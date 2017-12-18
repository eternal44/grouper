require 'optparse'
require './group_generator.rb'

def file_storage_path
  './grouper.txt'
end

def participants
  File.readlines(file_storage_path)
end

OptionParser.new do |opts|
  opts.banner = "Usage: ruby lunch_grouper [options]"

  opts.on('-a', '--add  x,y,z', Array, 'Adds new participants') do |new_lunchers|
    GroupGenerator.add_new_lunchers(file_storage_path, new_lunchers)
  end

  opts.on('-g', '--generate', 'Generates random groups of 3-5 participants') do
    GroupGenerator.generate_groups(participants)
  end

  opts.on('-l', '--list', 'Lists participants') do
    participants.readlines.each do |participant|
      p participant.strip
    end
  end
end.parse!

