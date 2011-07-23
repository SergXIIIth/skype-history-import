# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "skype-history-import"
  gem.homepage = "http://github.com/SergXIIIth/skype-history-import"
  gem.license = "MIT"
  gem.summary = %Q{Skype history import}
  gem.description = %Q{Manualy user copy chat history to file or string and after gem import(parse) it to class Message}
  gem.email = "smkrbr@gmail.com"
  gem.authors = ["SergXIIIth"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "skype-history-import #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :done do
	sh 'git add .'
	sh "git commit -a -m \"#{ENV['m']}\""
	sh 'git push'
end

task :up do
	sh 'git pull origin master'
end

