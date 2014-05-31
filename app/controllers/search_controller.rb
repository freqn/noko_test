class SearchController < ApplicationController

  def index
    @fetch_link = RedditScraper.new.fetch
  end


end
