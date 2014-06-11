# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'motion/persistable/version'

Gem::Specification.new do |spec|
  spec.name          = "motion-persistable"
  spec.version       = Motion::Persistable::VERSION
  spec.authors       = ["Bodacious"]
  spec.email         = ["gavin@katanacode.com"]
  spec.description   = %q{Persistable attributes for Rubymotion classes}
  spec.summary       = %q{A nice wrapper around Bubble-wrap's App::Persistence module that adds class macros for attributes that are persistable}
  spec.homepage      = "http://github.com/KatanaCode/motion-persistable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'bubble-wrap'
  spec.add_development_dependency 'motion-stump'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
