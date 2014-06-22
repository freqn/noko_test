class SearchController < ApplicationController


  def index
    params[:q] = 'rails' if params[:q].blank?
    @reddit_query = params[:q].gsub(/\s/,'')
    @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(@reddit_query)
    @client = TwitterClient.client
    tweet_links
  end

  def tweet_links

    params[:q] = 'rails' if params[:q].blank?
    @tweet_query = params[:q].gsub(/\s/,"%20").downcase
    @tweets = []
    @client.search(params[:q]).take(300).each do |tweet|
        @tweets << tweet.text
    end
  end
end
