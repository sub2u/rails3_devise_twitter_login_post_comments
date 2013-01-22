TWITTER_APP_KEY = 'smPQ7qpwBOAVizPWC1Z0kA'
TWITTER_SECRET_KEY = 'WgVQMGKGzKb2cGg4w5hoJ0DMKHKYaTfVku2HDu50Rk'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_APP_KEY, TWITTER_SECRET_KEY
end