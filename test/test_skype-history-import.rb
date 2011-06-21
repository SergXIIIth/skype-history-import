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

=begin
		should "today messages" do
			messages = <<-message
[16:57:04] sam: ок, я Юре в понедельник тогда подвезу ноут или в воскресенье, если он работает
[16:58:39] Elenka: ок договрились!
			message
			
			result = import(message)
		end
	
		should "edited message" do
			messages = <<-message
[14/06/2011 09:28:45 | Edited 09:29:02] sam: not yet, just personal staff
			message
			
			result = import(message)
		end

		should "deleted message" do
			messages = <<-message
			message
			
			result = import(message)
		end
=end
	end
end
