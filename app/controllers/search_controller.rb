class SearchController < ApplicationController

  def index
    params[:q] = 'rails' if params[:q].blank?
    @reddit_query = params[:q].gsub(/\s/,'')
    @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(@reddit_query)
    @fetch_hn = HnScraper.new.fetch_hn_headlines(params[:q])
    @client = TwitterClient.client
    tweet_links
  end

  def tweet_links
    params[:q] = 'rails' if params[:q].blank?
    @tweet_query = params[:q].gsub(/\s/,"%20").downcase
    @tweets = []
    @client.search(params[:q]).take(70).each do |tweet|
        @tweets << tweet.text
    end
  end
end
