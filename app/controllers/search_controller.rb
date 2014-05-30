class SearchController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
    @doc = Nokogiri::HTML(open("http://www.reddit.com/r/ruby"))
  end

end
