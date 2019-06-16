Rails.application.routes.draw do
  get '/', to: redirect('api/documentation/v1')

  scope :api do
    get '/documentation/:version', to: 'documentation#show'
  end

  scope :api, module: :v1 do
    namespace :users do
      post :registration
      post :login
    end
  end
end
