# how to use
# ruby csv-simple-union.rb header=no input=inputfile[,inputfile2...]
require 'csv'

#default options
options = {
	'header' => false,
	'input' => []
}

# process options
ARGV.each { |option|
	idx = option.index('=');
	key = option[0,idx]
	val = option.slice(idx+1..-1)
	options[key] = case key
	when 'header' then
		['yes', 'true', '1'].include?(val.downcase)
	when 'input' then
		val.split(',')
	else
		val
	end
}

#input and output
options['input'].each_with_index { |file_name, idx|
	CSV.read(file_name).each_with_index { |line, line_no|
		next if options['header'] && idx != 0 && line_no == 0
		puts line.to_csv
	}
}