require 'active_model'
require 'active_support/concern'

module BasicModel
  extend ActiveSupport::Concern
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send "#{name}=", value
    end unless attributes.nil?
  end
  
  def persisted?
    false
  end
end
