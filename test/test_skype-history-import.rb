# -*- encoding : utf-8 -*-
require 'helper'
require 'date'

class TestSkypeHistoryImport < Test::Unit::TestCase
	context "a importer" do
		should "import two message" do
			messages = <<-message
[14/06/2011 09:25:15] Di: a deal? are you trading something?
[14/06/2011 09:28:45] sam: not yet, just personal staff
			message
			
			result = import(messages)
			
			assert_equal(2, result.count, "Two message should be")
			
			di = result[0]
			
			assert_equal("Di", di.nick)
			assert_equal(DateTime.new(2011,06,14, 9,25,15), di.date)
			assert_equal("a deal? are you trading something?", di.text)
		end

		
		should "import milti lines message" do
			messages = <<-message
[14/06/2011 09:28:45] sam: In Ruby's $SAFE semantics, safe level of 4 is used to run a untrusted code (such as plugin). So in upper safe levels, some sort of operations are prohibited to prevent untrusted codes from attacking outer (trusted) data.

Exception#to_s was found to be problematic around it. The method can trick safe level mechanism and destructively modifies an untaitned string to be tainted. With this an attacker can modify arbitrary untainted strings like this:
[14/06/2011 09:28:50] sam: wedwed
			message
			
			result = import(messages)

			assert_equal(2, result.count, "Two message should be")
			message = result[0]
			assert_equal(452, message.text.size, "message too short")
		end

		should "edited message" do
			messages = <<-message
[14/06/2011 09:28:45 | Edited 09:29:02] sam: not yet, just personal staff
			message
			
			result = import(messages)[0]
			
			assert_equal("sam", result.nick)
			assert_equal(DateTime.new(2011,06,14, 9,28,45), result.date)
		end

		should "deleted message" do
			messages = <<-message
[22/06/2011 16:26:57 | Removed 11:49:30] sam: This message has been removed.
			message
			
			result = import(messages)[0]
			
			assert_equal("sam", result.nick)
			assert_equal(DateTime.new(2011,06,22, 16,26,57), result.date)
		end
		
		should "import real chat" do
			file = File.open("/home/msa/real_skype_chat.txt", "rb")
			messages = file.read			
			result = import(messages)
			p "so real messages count is #{result.size}"
		end
		
=begin
file send
[08/12/2010 17:01:46] *** sam sent ps.js ***

call
[20/06/2011 18:37:28] *** Call to Echo / Sound Test Service, duration 00:44. ***

today
[16:57:04] sam: ок, я Юре в понедельник тогда подвезу ноут или в воскресенье, если он работает

=end
	end
end
