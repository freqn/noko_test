class SearchController < ApplicationController
  before_action :default_query

  def index
    @reddit_query = params[:q].gsub(/\s/,'')
    @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(@reddit_query)
    @client = TwitterClient.client
    tweet_links
  end

  def tweet_links
    @tweet_query = params[:q].gsub(/\s/,"%20").downcase
    @tweets = []
    @client.search(params[:q]).take(50).each do |tweet|
        @tweets << tweet.text
        if @tweets.include? "http"
          x = URI.extract(@tweets)
        end
    end
  end

  def default_query
    params[:q] = 'rails' if params[:q].blank?
  end

end
