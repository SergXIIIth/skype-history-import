def import(text)
	result = []
	
	regex = Regexp.new(/^\[(.*)\] (.*): (.*)/)

	message_raw = regex.match(text)
	while message_raw != nil
		
		message = Message.new
		message.date = DateTime.strptime(message_raw[1], "%d/%m/%Y %H:%M:%S");
		message.nick = message_raw[2];
		message.text = message_raw[3];
		
		result.push(message)
		
		message_raw = regex.match(message_raw.post_match)
	end

	result
end

class Message
	attr_accessor :date, :nick, :text
end