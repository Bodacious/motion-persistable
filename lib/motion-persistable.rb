unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require 'bubble-wrap/core'

require 'motion/persistable/version'

Motion::Project::App.setup do |app|
  path_string = File.join(File.dirname(__FILE__), 'motion/persistable.rb')
  Dir.glob(path_string).each do |file|
    app.files.unshift(file)
  end
end

