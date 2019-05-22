Rails.application.configure do
  config.trailblazer.use_loader = false
  config.trailblazer.application_controller = 'ApiController'
end
