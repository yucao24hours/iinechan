require "twitter"
require "dotenv"

Dotenv.load

config = {
  consumer_key: ENV["CONSUMER_KEY"],
  consumer_secret: ENV["CONSUMER_SECRET"],
  access_token: ENV["ACCESS_TOKEN"],
  access_token_secret: ENV["ACCESS_TOKEN_SECRET"]
}

client = Twitter::REST::Client.new(config)
client.user_timeline("yucao24hours").each do |tweet|
  puts tweet.created_at
  puts tweet.text
  puts "RT: #{tweet.retweet_count}"
  puts "Fav: #{tweet.favorite_count}"
end
