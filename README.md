# BasicModel

BasicModel is intended to be used as a tableless model in Rails. It complies with the ActiveModel API and includes validations, so it can be used in form helpers without a problem.

## Usage

    gem install basic_model
    
    # Gemfile
    gem 'basic_model'
    
    # models/message.rb
    class Message < BasicModel
      attr_accessor :name, :email, :content
  
      # can even include validations
      validates_presence_of :name
    end

## Copyright

Copyright (c) 2009 [Peter Browne](http://petebrowne.com). See LICENSE for details.
