require 'nokogiri'
require 'open-uri'

class RedditScraper

  def initialize
    @headline = []
  end

  def fetch
    doc = Nokogiri::HTML(open("http://www.reddit.com/r/ruby"))
    doc.css('a.title').each do |link|
      if link['href'].include?('http')
        @headline << { content: link.content, href: link['href'] }
      else
        @headline << { content: link.content, href: "http://reddit.com" + link['href'] }
      end

    end
    @headline
  end

end
