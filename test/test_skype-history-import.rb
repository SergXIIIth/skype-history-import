# -*- encoding : utf-8 -*-
require 'helper'

class TestSkypeHistoryImport < Test::Unit::TestCase
	context "a importer" do
		should "import one message" do
			messages = <<-message
[14/06/2011 09:25:15] Di: a deal? are you trading something?
[14/06/2011 09:28:45] sam: not yet, just personal staff
			message
			
			result = import(message)
			di = result[0]
			sam = result[1]
			
			assert_equal("Di", di.nick)
			assert_equal("14/06/2011 09:25:15", di.date)
			assert_equal("a deal? are you trading something?", di.message)
		end

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
	end
end
