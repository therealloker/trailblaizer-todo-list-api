module V1
  class ApplicationController < ActionController::API
    include Authentication
    include DefaultEndpoint
  end
end
