# frozen_string_literal: true

require 'reform'
require 'reform/form/dry'
require 'dry/validation/compat/form'
require 'jsonapi/serializable'

Rails.application.configure do
  config.trailblazer.enable_loader = false
  config.trailblazer.application_controller = 'ApplicationController'
end
