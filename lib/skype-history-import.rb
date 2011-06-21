def import(text)
	result = []
	
	puts text
	
	regex = Regexp.new(/^(\[.*)$/i)

	matchdata = regex.match(text)
	while matchdata != nil
		puts "matchdata=#{matchdata[1]}"
		
		result.push(Message.new)
		
		matchdata = regex.match(matchdata.post_match)
	end

	result
end

class Message
	attr_accessor :date, :nick, :message
end