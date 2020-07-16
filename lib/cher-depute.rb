require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_res(url)
  page = Nokogiri::HTML(open(url))
  res = Hash.new
  name = page.xpath('/html/body/div[1]/div[3]/div/div/div/section[1]/div/article/div[2]/h1')
  name_array = name.text.split(' ')
  email = page.xpath('/html/body/div[1]/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
  res['first_name'] = name_array[1]
  res['last_name'] = name_array[2]
  res['email'] = email.text
  return res
end

def get_urls
  page = Nokogiri::HTML(open())
  # récupération des liens
  puts "Start scraping..."
  urls = page.xpath('//*[@id="deputes-list"]//li/a')
  return urls
end

def perform
  source_url = 
  results = []
  # récupération des données dans un tableau
  get_urls.each do |link|
    url = source_url + link['href']
    results << get_res(url)
  end
  return results
end

# P.P
perform