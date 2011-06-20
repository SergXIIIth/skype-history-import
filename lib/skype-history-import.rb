def import(text)
	[Message.new, Message.new]
end

class Message
	attr_accessor :date, :nick, :message
end