# BasicModel

BasicModel is intended to be used in a tableless model in Rails >= 3.0. It complies with the ActiveModel API and includes valdiations, so it can be used in form helpers without a problem.

## Usage

    gem install basic_model
    
    # Gemfile
    gem 'basic_model'
    
    # models/message.rb
    class Message
      include BasicModel
      attr_accessor :name, :email, :content
  
      # can even include validations
      validates_presence_of :name
    end
    
    # Somewhere else
    message = Message.new(:email => "foo", :content => "bar")
    message.valid?
    message.errors[:name] # => ["can't be blank"]

## Copyright

Copyright (c) 2011 [Peter Browne](http://petebrowne.com). See LICENSE for details.
