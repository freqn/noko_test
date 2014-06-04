class SearchController < ApplicationController

  def index
    @fetch_reddit = RedditScraper.new.fetch_reddit_headlines(params[:q])
    #@fetch_hackernews = YcombScraper.new.fetch_hackernews_headlines
  end


end
