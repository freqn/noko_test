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
    @client.search(params[:q]).take(50).each do |tweet|
        @tweets << tweet.text
        if @tweets.include? "http"
          x = URI.extract(@tweets)
        end
    end
  end
end
