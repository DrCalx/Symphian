OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider  OmniAuth::Strategies::Facebook, 
            Rails.application.secrets.facebook_app_id,
            Rails.application.secrets.facebook_app_secret
  
  provider  OmniAuth::Strategies::GoogleOauth2, 
            Rails.application.secrets.google_client_id, 
            Rails.application.secrets.google_client_secret, 
            {
              scope:        'calendar',
              access_type:  'offline'
            }
end