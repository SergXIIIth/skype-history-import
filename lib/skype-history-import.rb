def import(text)
	result = []
	
	message = Message.new
	
	while text.strip.size > 0
		if text =~ /^\[(.*)\] (.*): (.*)/

			# handle tail of prev multi line message
			unless $` == nil or message.text == nil or $`.strip == ""
				message.text += $`
			end
			
			# message start
			message = Message.new
			
			begin
				message.date = DateTime.strptime($1, "%d/%m/%Y %H:%M:%S")
				message.nick = $2
				message.text = $3
			rescue
				puts "Exception '#{$!}' on match *** #{$~} ***"
				raise
			end
			
			result.push(message)
		end
		
		
		text = $'
	end

	result
end

class Message
	attr_accessor :date, :nick, :text
end