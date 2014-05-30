class SearchController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
    @url_1 = "http://www.reddit.com/r/ruby"
    @doc = Nokogiri::HTML(open(@url_1))
  end

end
