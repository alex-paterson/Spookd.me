OmniAuth.config.logger = Rails.logger
if Rails.env.production?
	Rails.application.config.middleware.use OmniAuth::Builder do
	  provider :facebook, ENV['PRODUCTION_FACEBOOK_KEY'], ENV['PRODUCTION_FACEBOOK_SECRET']
	end
else
	Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['DEVELOPMENT_FACEBOOK_KEY'], ENV['DEVELOPMENT_FACEBOOK_SECRET']
	end
end
