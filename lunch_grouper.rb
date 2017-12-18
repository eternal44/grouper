require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on('-a', '--add  x,y,z', Array, 'Adds new participants') do |v|
    options[:new_people] = v
  end

  opts.on('-l', '--list', 'Lists participants') do
    p 'List of people'
  end

  opts.on('-g', '--generate', 'Generates random groups of 3-5 participants') do
  end
end.parse!

if __FILE__ == $PROGRAM_NAME
end
