class Scraping
  def self.spot_urls
    agent = Mechanize.new
    page = agent.get("https://www.gikai.metro.tokyo.jp/link/municipalities.html")
    elements = page.search(".page.list ul a")
    elements.each do |ele|
      get_spot(ele)
    end
  end

  def self.get_spot(link)
    name = link.inner_text
    url = link.get_attribute("href")
    spot = Spot.where(name: name, url: url).first_or_initialize
    spot.save
  end
end
