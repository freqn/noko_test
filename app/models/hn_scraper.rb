require 'nokogiri'
require 'open-uri'
require 'mechanize'


class HnScraper

  def initialize
    @headline = []
    @agent = Mechanize.new
  end

  def fetch_hn_headlines(hn_topic)

    hn_topic = "rails" if hn_topic.blank?

    url = "http://news.ycombinator.com"

    mech_page = @agent.get(url)
    num_pages_to_scrape = 3
    count = 0
    if mech_page.link_with(text: /More /)
      num_pages_to_scrape = 3
    end

    while(num_pages_to_scrape > count )
      page = mech_page.parser

      page.css('.title a').each do |link|
        if link['href'].include?('http')
          @headline << { content: link.content, href: link['href'] }
        # else
        # @headline << { content: link.content, href: "http://reddit.com" + link['href'] }
        end
       end

      count += 1
      # if num_pages_to_scrape > 1
      #  mech_page = @agent.get(page.css('.nextprev').css('a').last.attributes['href'].value)
      # end
    end
    @headline
  end
end
