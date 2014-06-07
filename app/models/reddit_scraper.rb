require 'nokogiri'
require 'open-uri'
require 'mechanize'


class RedditScraper

  def initialize
    @headline = []
    @agent = Mechanize.new
  end

  def fetch_reddit_headlines(subreddit)
    subreddit = 'all' if subreddit.blank?
    @url = "http://www.reddit.com/r/#{subreddit}"
    mech_page = @agent.get(@url)

    num_pages_to_scrape = 2
    count = 0

    while(num_pages_to_scrape > count)
      page = mech_page.parser

      page.css('a.title').each do |link|
        if link['href'].include?('http')
          @headline << { content: link.content, href: link['href'] }
        else
          @headline << { content: link.content, href: "http://reddit.com" + link['href'] }
        end
      end
      @headline

      count += 1
      mech_page = @agent.get(page.css('.nextprev').css('a').last.attributes["href"].value)
    end

    return @headline
  end
end
