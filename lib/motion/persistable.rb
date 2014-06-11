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
            if App::Persistence[send("_#{method_name}_key")].nil? and default_value
              App::Persistence[send("_#{method_name}_key")] = default_value
            end          
            App::Persistence[send("_#{method_name}_key")]
          end
      
          define_method "#{method_name}=" do |value|
            App::Persistence[send("_#{method_name}_key")] = value
            callback.call(value) if callback
            App::Persistence[send("_#{method_name}_key")]
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