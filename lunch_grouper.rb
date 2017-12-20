require 'optparse'
require './group_generator.rb'

def file_storage_path
  './grouper.txt'
end

def participants
  File.readlines(file_storage_path)
end

def display_groups(groups)
  groups.each_with_index do |group, index|
    puts "Group ##{index + 1}:"

    group.each do |participant|
      puts participant
    end

    puts

    # NOTE: this line prevents #each from printing the group array
  end; nil
end


OptionParser.new do |opts|
  opts.banner = "Usage: ruby lunch_grouper [options]"

  opts.on('-a', '--add  x,y,z', Array, 'Adds new participants') do |new_lunchers|
    GroupGenerator.add_new_lunchers(file_storage_path, new_lunchers)
  end

  opts.on('-g', '--generate', 'Generates random groups of 3-5 participants') do
    generated_groups = GroupGenerator.generate_groups(participants)

    display_groups(generated_groups)
  end

  opts.on('-l', '--list', 'Lists participants') do
    participants.sort.each do |participant|
      puts participant.strip
    end
  end
end.parse!

