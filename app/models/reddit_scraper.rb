require 'nokogiri'
require 'open-uri'
require 'mechanize'


class RedditScraper
  def initialize
    @headline = []
    @agent = Mechanize.new
  end

  def fetch_reddit_headlines(subreddit)
    url = "http://www.reddit.com/search?q=#{subreddit.gsub(/\s/,"+")}&sort=new"
    mech_page = @agent.get(url)
    num_pages_to_scrape = 1
    count = 0

    if mech_page.link_with(text: /next /)
      num_pages_to_scrape = 3
    end

    while(num_pages_to_scrape > count )
      page = mech_page.parser
      page.css('a.title').each do |link|
        unless link.content.include?('/r/')
          if link['href'].start_with?('http')
            @headline << { content: link.content, href: link['href'] }
          else
            @headline << { content: link.content, href: "http://reddit.com" + link['href'] }
          end
        end
      end
      count += 1
    end
    @headline
  end
end
