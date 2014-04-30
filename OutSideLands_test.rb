require 'nokogiri'
require 'open-uri'

items = Array.new
prices = Array.new

doc = Nokogiri::HTML(open("http://portland.craigslist.org/search/?sort=rel&areaID=9&subAreaID=&query=outside+lands&catAbb=sss"))

items = doc.xpath("html/body/article/section/div/div[2]/p/span[2]/a").collect {|node| node.text.strip}

prices = doc.xpath("/html/body/article/section/div/div[2]/p/span[3]/span").collect {|node| node.text.strip}
prices.delete("")

items.zip(prices).each do |title,prices|
 puts title+"********"+prices
end

