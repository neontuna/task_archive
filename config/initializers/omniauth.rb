Rails.application.config.middleware.use OmniAuth::Builder do
  ***REMOVED***
  # provider :azure_activedirectory, ENV['AAD_CLIENT_ID'], ENV['AAD_TENANT']
  # other providers here
end