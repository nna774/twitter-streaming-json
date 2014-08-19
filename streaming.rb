require 'twitter'
require 'json'

require './config.rb'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCSESS_TOKEN
  config.access_token_secret = ACCSESS_SECRET
end
client.user do |object|
  if object.is_a?(Twitter::Tweet)
    puts JSON::generate(object.to_h)
  end
  # if object.is_a?(Twitter::Streaming::DeletedTweet)
  #   p "[DELETE]", object.to_h
  # end

end
