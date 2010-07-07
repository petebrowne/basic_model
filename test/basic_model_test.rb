lib = File.expand_path('../../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'rubygems'
require 'test/unit'
require 'active_support/test_case'
require 'active_model'
require 'basic_model'

class Post < BasicModel
  attr_accessor :title, :body
end

class BasicModelTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests
  
  def setup
    @model = BasicModel.new
  end
  
  def test_initialize_with_attributes
    post = Post.new(:title => 'Title', :body => 'Body')
    assert_equal 'Title', post.title
    assert_equal 'Body', post.body
  end
end
