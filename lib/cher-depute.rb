require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Retourne la page à scrapper
def get_page(url_page)
  return Nokogiri::HTML(open(url_page))
end 