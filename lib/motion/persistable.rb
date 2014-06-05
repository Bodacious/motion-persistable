require "motion/persistable/version"
require 'bubble-wrap/core'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

module Motion
  module Persistable
  
    def self.included(base)
      base.extend ClassMethods
    end
  
    def persistence_key
      if respond_to?(:key)
        key
      else
        name
      end
    end
    
    module ClassMethods
    
      def attr_persisted(method_name, default_value = nil, key_suffix = nil, &block)
        callback = block if block_given?

        instance_eval do
                
          define_method method_name do
            if App::Persistence["_#{method_name}_key"].nil?
              App::Persistence["_#{method_name}_key"] = default_value
            end
            App::Persistence["_#{method_name}_key"]
          end
        
          define_method "#{method_name}=" do |value|
            App::Persistence["_#{method_name}_key"] = value
            callback.call(value) if callback
          end
        
        
          define_method "_#{method_name}_key" do
            key_suffix = send(key_suffix) if key_suffix.is_a?(Symbol)
            [persistence_key, key_suffix, method_name].compact.join('.')
          end
        
          private "_#{method_name}_key"
        
        end
      end
 
    end
  
  end
end