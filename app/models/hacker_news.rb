require 'nokogiri'
require 'open-uri'
require 'mechanize'


class HnScraper

  def initialize
    @headline = []
    @agent = Mechanize.new
  end

  def fetch_hn_headlines

    url = "http://news.ycombinator.com"

    mech_page = @agent.get(url)
    num_pages_to_scrape = 1
    count = 0
    if mech_page.link_with(text: /More /)
      num_pages_to_scrape = 10
    end

    while(num_pages_to_scrape > count )
      page = mech_page.parser

      page.css('a.title').each do |link|
        if link['href'].include?('http')
          @headline << { content: link.content, href: link['href'] }
        end
       end

      count += 1
      if num_pages_to_scrape > 1
        mech_page = @agent.get(page.css('.title').css('a').last.attributes['href'].value)
      end
    end
    @headline
  end
end

end
