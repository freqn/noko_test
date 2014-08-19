require 'nokogiri'
require 'open-uri'
require 'mechanize'


class GoogleScraper
  def initialize
    @headline = []
    @agent = Mechanize.new
  end

  def fetch_google_headlines(topic)
    url = "https://www.google.com/#q=#{topic.gsub(/\s/,"+")}&tbs=qdr:d"
    mech_page = @agent.get(url)
    num_pages_to_scrape = 1
    count = 0

    if mech_page.link_with(text: /Next /)
      num_pages_to_scrape = 3
    end

    while(num_pages_to_scrape > count )
      page = mech_page.parser
      page.css('h3.r a').each do |link|
        @headline << { content: link.content, href: link['href'] }
      end

      count += 1
      if num_pages_to_scrape > 1
        mech_page = @agent.get(page.css('.pn').css('a').last.attributes['href'].value)
      end
    end
    @headline
  end
end