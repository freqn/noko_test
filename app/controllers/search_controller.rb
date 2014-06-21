class SearchController < ApplicationController


  def index
    @reddit_query = params[:q].gsub(/\s/,'')
    @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(@reddit_query)
    @client = TwitterClient.client
    tweet_links
  end

  def tweet_links

    @tweet_query = params[:q].gsub(/\s/,"%20").downcase
    params[:q] = 'rails' if @tweet_query.blank?
    @tweets = @client.search(@tweet_query).take(50).each do |tweet|
        results = tweet.text
        if results.include? "http"
          x = URI.extract(results)
        end
    end
  end
end
