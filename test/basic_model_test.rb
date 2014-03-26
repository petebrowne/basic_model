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

class Comment
  include BasicModel
  attr_accessor :name, :comment, :spam

  if defined? ActiveModel::MassAssignmentSecurity
    include ActiveModel::MassAssignmentSecurity
    attr_accessible :name, :comment
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

  if defined? ActiveModel::MassAssignmentSecurity
    def test_mass_security_assignment
      @model = Comment.new(:name => 'Bob', :comment => 'Great post!', :spam => false)
      assert_nil @model.spam
    end
  end

  def test_initialize_with_yield
    @model = Post.new do |post|
      post.title = 'Title'
    end
    assert_equal 'Title', @model.title
  end
end
