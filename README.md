# Motion::Persistable

## Persistable attributes for Rubymotion classes

A nice wrapper around Bubble-wrap's App::Persistence module that adds class macros for attributes that are persistable

## Installation

Add this line to your application's Gemfile:

    gem 'motion-persistable'

And then execute:

    $ bundle


Or install it yourself with:

    $ gem install motion-persistable

...add this line to your application's Rakefile:
    
    Bundler.require # this should already be there
    require 'motion-persistable'


## Usage

Include the module **Motion::Persistable** in any class that you want persistable attributes

### Persistable Instance Methods

    class User
  
      include Motion::Persistable
  
      # Define this in your model to use your own key, otherise it will try and call 
      # name() on the instance by default
      def persistence_key
        "User"
      end
      
      # This will persist the user's email under the key: "User.bodacious.email" (where the
      # user's username was bodacious)
      attr_persisted :email, '', :username

      # This will set an attribute called age, with a default value of 16.
      # When a new value is set, the block is called, in this case it's recorded on TestFlight
      attr_persisted :age, 16, :username do |value|
        testflight_checkpoint("Set new age value", age: value)
      end
  
      class << self 
        include Motion::Persistable # for class methods

        # This will set a class attribute User.count with a default value of 0
        attr_persisted :count, 0
      end
  
    end
  

## Considerations

The obvious drawback with this current approach is that instances require unique keys.
For the project this was designed for, this wasn't an issue but if your instances don't 
already have some sort of unique identifier then this gem might not be best for you.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
