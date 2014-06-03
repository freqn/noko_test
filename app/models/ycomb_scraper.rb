require 'nokogiri'
require 'open-uri'

class YcombScraper

  def initialize
    @headline = []
  end

  def fetch_hackernews_headlines
    doc = Nokogiri::HTML(open("http://news.ycombinator.com"))
    doc.css('.title a').each do |link|
      @headline << { content: link.content, href: link['href'] }
    end
    @headline
  end
end
