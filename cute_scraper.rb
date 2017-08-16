require 'nokogiri'
require 'open-uri'

class CuteScraper
  def self.load
    # go to reddit
    url = "https://www.reddit.com/r/aww/"
    cute_url = []
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.css('.thing .thumbnail img').each do |thing|
      piece = thing.attr('src')
      cute_url << "http:#{piece}"
    end
    cute_url
  end
end
