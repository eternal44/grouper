require 'csv'

module GroupGenerator
  module_function

  def add_new_lunchers(new_lunchers, destination_file)
    File.open(destination_file, 'a') do |file|
      new_lunchers
        .compact
        .each { |luncher| file.puts luncher }
    end
  end

  def generate_groups(participants)
    participants = participants.shuffle

    return [participants] if participants.count < 3

    case participants.count % 3
    when 0
      return participants.each_slice(3).to_a
    when 1
      groups = participants.each_slice(3).to_a
      last_group = groups.pop

      groups.last.concat(last_group)

      return groups
    when 2
      groups = participants.each_slice(3).to_a

      last_person, second_to_last_person = groups.pop

      groups[-1] << last_person
      groups[-2] << second_to_last_person

      return groups
      end
  end

  def print_participants(participants)
    participants.each { |p| puts p }
  end
end
