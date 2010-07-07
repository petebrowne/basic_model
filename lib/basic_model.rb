require 'active_model'

class BasicModel
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end unless attributes.nil?
  end
  
  def persisted?
    false
  end
end
