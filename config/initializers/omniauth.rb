OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider  OmniAuth::Strategies::Facebook, 
            ENV['FB_APP_ID'],
            ENV['FB_APP_SECRET']
  
  provider  OmniAuth::Strategies::GoogleOauth2, 
            ENV['GOOGLE_CLIENT_ID'],
            ENV['GOOGLE_CLIENT_SECRET'],
            {
              scope: ['userinfo.email',
                      'userinfo.profile',
                      'https://www.googleapis.com/auth/calendar',
                      'https://www.googleapis.com/auth/calendar.readonly'],
                          
              access_type:  'offline'
            }
end