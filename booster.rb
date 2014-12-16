#!/usr/bin/env ruby

require 'twitter'

PICK = 7

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

%w[
  socialmedia marketing seo leadership business startup entreprenuer programming ruby 
  rails python javascript angularjs branding influence coding
].each do |topic|
  client.search("##{topic}", result_type: 'recent').take(PICK).collect { |tweet| client.favorite(tweet)  }
end
