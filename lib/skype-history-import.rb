require 'date'
require 'stringex'

module SkypeHistoryImport
	class Importer
		attr_accessor :nike_to_email_mapping
		
		def nike_to_email_map(nick, email)
			@nike_to_email_map = Hash.new if @nike_to_email_map.nil?
			@nike_to_email_map[nick] = email
		end
		
		def run(text)
			result = []
			
			message = Message.new
			
			while text.strip.size > 0
				if text =~ /^\[(.+)\] (.+?): (.*)/
					
					# handle tail of prev multi line message
					unless $` == nil or message.text == nil or $`.strip == ""
						message.text += $`
					end
					
					# if date is only time, then found string is boby of prev message
					time = DateTime.strptime($1, "%H:%M:%S") rescue nil
					if time
						message.text += $&
					else
						# message start
						message = Message.new
						
						begin
							message.date = DateTime.strptime($1, "%d/%m/%Y %H:%M:%S")
							message.nick = $2
							message.text = $3
							
							if @nike_to_email_map.nil? == false && @nike_to_email_map.has_key?(message.nick)
								message.email = @nike_to_email_map[message.nick]
							end
							
						rescue
							puts "Exception '#{$!}' on match *** #{$~} ***"
							raise
						end
						
						result.push(message)
					end
					
				end
				
				text = $'
			end
		
			result
		end
	end

	class Message
		attr_accessor :date, :nick, :text
		
		# make email from nick, like nick@skype.com
		def email
			if @email.nil?
				@email = nick.to_url.gsub(/\W/,'')
				@email = "#{@email}@skype.com"
			end
			@email
		end
		
		def email=(value)
			@email = value
		end
	end
end

def import(text)
	importer = SkypeHistoryImport::Importer.new
	importer.run(text)
end

class Message < SkypeHistoryImport::Message
end