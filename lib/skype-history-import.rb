def import(text)
	result = []
	
	while text.strip.size > 0
		
		if text =~ /^\[(.*)\] (.*): (.*)/
			# message start
			message = Message.new
			message.date = DateTime.strptime($1, "%d/%m/%Y %H:%M:%S")
			message.nick = $2
			message.text = $3
			
			result.push(message)
		else
			# multi line message 
			text =~ /(.*)/
			message.text += $1
		end
		
		p " --- "
		p text
		
		text = $'
	end

	result
end

class Message
	attr_accessor :date, :nick, :text
end