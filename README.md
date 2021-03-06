# Installation

```ruby
gem install skype-history-import
```
 
# How to use skype-history-import

Open Skype -> Throught context menu Select all message -> Put them in file or string -> run function 'import'

Example

``` ruby
require 'rubygems'
require 'skype-history-import'
include SkypeHistoryImport
	
file = File.open("/home/msa/real_skype_chat.txt", "rb")
messages = file.read			
	
result = import(messages)
	
p "so real messages count is #{result.size}"
p "first message #{result[0].inspect}"
```

## Contributing to skype-history-import
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 SergXIIIth. See LICENSE.txt for
further details.

