require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "rubygems-json-list"
    s.summary = "Gem Command to return the results of gem list as json"
    s.description = <<-DESC
      List local and remote gems and return the ouput as JSON
    DESC
    s.email = "dan@kallistec.com"
    s.homepage = "http://github.com/danielsdeleo"
    s.authors = ["Daniel DeLeo"]
    s.has_rdoc = false
    s.files = FileList["[A-Z]*", "{bin,lib,spec}/**/*"]
    
    # Testing
    s.test_files = FileList["spec/**/*.rb"]
    s.add_dependency 'json', '~> 1.4.1'
  end

rescue LoadError
  puts "Jeweler not available. Install it for gem-related tasks with: (sudo) gem install jeweler"
end
