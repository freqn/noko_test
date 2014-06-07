class TweetsController < ApplicationController

  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = Rails.application.secrets.twitter_key
    config.consumer_secret     = Rails.application.secrets.twitter_secret
    config.access_token        = Rails.application.secrets.twitter_token
    config.access_token_secret = Rails.application.secrets.twitter_token_secret
  end


end
