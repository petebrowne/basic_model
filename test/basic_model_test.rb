require 'rubygems'
require 'test/unit'
require 'active_support/test_case'
require 'active_model'
require File.expand_path('../../lib/basic_model', __FILE__)

class Post
  include BasicModel
  attr_accessor :title, :body
end

class BasicModelTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests
  
  def setup
    @model = Post.new
  end
  
  def test_initialize_with_attributes
    post = Post.new(:title => 'Title', :body => 'Body')
    assert_equal 'Title', post.title
    assert_equal 'Body', post.body
  end
end