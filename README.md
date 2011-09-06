BasicModel
==========

BasicModel is intended to be used in a tableless model in Rails >= 3.0. It complies with the ActiveModel API and includes validations, so it can be used in form helpers without a problem.

Installation
------------

``` bash
$ gem install basic_model
```

Usage
-----
    
``` ruby
require 'basic_model'

class Message
  include BasicModel
  attr_accessor :name, :email, :content

  # can even include validations
  validates_presence_of :name
end

message = Message.new(:email => 'bob@example.com', :content => 'Hey man!')
message.valid?
message.errors[:name] # => ["can't be blank"]
```

Using `ActiveModel::MassAssignmentSecurity`:

``` ruby
require 'active_model'
require 'basic_model'

class Comment
  include BasicModel
  include ActiveModel::MassAssignmentSecurity
  attr_accessor :name, :comment, :spam
  attr_accessible :name, :comment
end

comment = Comment.new(:name => 'Bob', :comment => 'Great Post!', :spam => false)
comment.spam # => nil
```

Copyright
---------

Copyright (c) 2011 [Peter Browne](http://petebrowne.com). See LICENSE for details.
