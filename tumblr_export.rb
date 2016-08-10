require "json"
require "tumblr_client"

Tumblr.configure do |config|
  config.consumer_key =       ENV.fetch("consumer_key")
  config.consumer_secret =    ENV.fetch("consumer_secret")
  config.oauth_token =        ENV.fetch("oauth_token")
  config.oauth_token_secret = ENV.fetch("oauth_token_secret")
end

class TumblrClient
  def self.client
    @@client ||= Tumblr::Client.new
  end
end

blog_name = ENV.fetch("blog_name")
number_of_posts = TumblrClient.client.info["user"]["blogs"].find { |blog| blog["name"] == blog_name }["posts"]
all_posts = 0.step(by: 21, to: number_of_posts).flat_map do |offset|
  puts "Fetching posts #{offset}..#{offset + 21}"
  posts = TumblrClient.client.posts(blog_name, offset: offset)
  posts["posts"]
end ; nil

File.open("#{blog_name}_posts.json", "w") { |file| file.write(JSON.pretty_generate(all_posts)) }
