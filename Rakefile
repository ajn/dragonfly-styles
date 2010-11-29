require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "dragonfly-styles"
    s.summary = %Q{Extends Dragonfly to allow for paperclip-like style definitions.}
    s.email = "alex@rawnet.com"
    s.homepage = "http://github.com/ajn/dragonfly-styles"
    s.authors = ["Alex Neill"]
    s.files = FileList['lib/**/*'].to_a
    s.add_dependency('dragonfly')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: (sudo) gem install jeweler"
end