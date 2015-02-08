OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '691899394255914', '88324b00615c87daf85cac4e999f3e2e', #App ID and Secret from FB
  display: "popup"
end