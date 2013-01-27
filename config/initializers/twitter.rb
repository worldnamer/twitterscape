begin # JWLL: Surrounded this initializer in a rescue block because this gets loaded during migrations, which exceptions on clean DB creates
  Twitter.configure do |config|
    credential = TwitterCredential.first

    config.consumer_key = credential.try(:consumer_key)
    config.consumer_secret = credential.try(:consumer_secret)
    config.oauth_token = credential.try(:oauth_token)
    config.oauth_token_secret = credential.try(:oauth_token_secret)
  end
rescue
end