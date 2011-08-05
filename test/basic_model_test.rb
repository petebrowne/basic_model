require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'test/unit'

class Post
  include BasicModel
  attr_accessor :title, :body
  
  private
  
  def not_allowed=(value)
    raise 'Not Allowed!'
  end
end

class BasicModelTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests
  
  def setup
    @model = Post.new
  end
  
  def test_initialize_with_attributes
    @model = Post.new(:title => 'Title', :body => 'Body')
    assert_equal 'Title', @model.title
    assert_equal 'Body', @model.body
  end
  
  def test_do_not_call_private_methods
    assert_nothing_raised do
      Post.new(:not_allowed => 'Oops')
    end
  end
end
