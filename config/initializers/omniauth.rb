TWITTER_CONFIG = YAML.load_file("#{Rails.root}/config/twitter.yml")[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CONFIG["twitter_key"], TWITTER_CONFIG["twitter_secret"]
end