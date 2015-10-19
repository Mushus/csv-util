# how to use
# ruby csv-simple-join.rb input=inputfile[,inputfile2...]
require 'csv'

#default options
options = {
	'input' => []
}

# process options
ARGV.each { |option|
	idx = option.index('=');
	key = option[0,idx]
	val = option.slice(idx+1..-1)
	options[key] = case key
	when 'input' then
		val.split(',')
	else
		val
	end
}

#input and output
csvs = options['input'].map { |file_name|
	CSV.read(file_name)
}

csvs[0].size.times do |line_no|
	puts csvs.map { |csv|
		csv[line_no]
	}.flatten.to_csv
end