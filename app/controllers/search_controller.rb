class SearchController < ApplicationController

  def index
    @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(params[:q])
    @client = TwitterClient.client
    tweet_links
  end

  def tweet_links
    @tweets = @client.search(params[:q]).take(50).each do |tweet|
        results = tweet.text
        if results.include? "http"
          x = URI.extract(results)
        end
    end
  end
end
