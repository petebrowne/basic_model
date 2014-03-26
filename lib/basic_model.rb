require "basic_model/version"
require "active_model"
require "active_support/concern"

module BasicModel
  extend ActiveSupport::Concern
  include ActiveModel::Conversion
  include ActiveModel::Validations

  # Creates and optionally sets the attributes of the model with keys
  # matching the attribute names. If ActiveModel::MassSecurityAssignment
  # is included, attributes will be sanitized with the role given in the :as option.
  # To bypass mass-assignment security you can use the :without_protection => true option.
  def initialize(attributes = nil, options = {})
    unless attributes.nil?
      # Sanitize the attributes if we're using ActiveModel::MassSecurityAssignment
      # Also account for the different APIs between 3.0 and 3.1
      if respond_to? :sanitize_for_mass_assignment
        if method(:sanitize_for_mass_assignment).arity == 2
          attributes = sanitize_for_mass_assignment attributes, options[:as]
        else
          attributes = sanitize_for_mass_assignment attributes
        end
      end

      # Now set the attributes, ignoring any private methods
      attributes.each do |name, value|
        send "#{name}=", value if respond_to? "#{name}="
      end
    end

    yield self if block_given?
  end

  # By default, BasicModels are not persisted in any way.
  def persisted?
    false
  end
end
