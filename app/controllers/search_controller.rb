class SearchController < ApplicationController

  def index
    @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(params[:q])
  end


end
