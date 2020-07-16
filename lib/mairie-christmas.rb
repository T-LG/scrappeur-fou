require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Retourne la page à scrapper
def get_page(url_page)
  return Nokogiri::HTML(open(url_page))
end 

# Retourne tableau de toutes les urls des villes du Val d'Oise 
def get_url_cities_array(page)
  url_cities_array = []
  urls = page.xpath('//*[@class="lientxt"]/@href') 
  urls.each do |url|
    url_cities_array << ("https://www.annuaire-des-mairies.com" + url.text[1..-1]) # rajout à partir du deuxième caractère pour éviter d'ajouter le point 
  end
  return url_cities_array
end

# retourne l'email d'une marie d'une ville du Val d'Oise (prise de liberté avec l'énoncé pour avoir, aussi, le nom, le tout dans un hash)
def get_townhall_email_hash(townhall_url)
  page = get_page(townhall_url)
  email_hash = Hash.new
  email = page.xpath('//*[contains(text(), "@")]').text
  town_name = page.xpath('//*[contains(text(), "Adresse mairie de")]').text.split #nom de ville
  email_hash = {town_name[3] => email} #nom
  return email_hash
end
# si on voulait suivre l'énoncé, il suffirait de retourner juste l'email et de faire ce qui est fait ici dans la méthode perform

# Méthode princiaple (perform), retourne twonhalls_emails_array
def perform
  puts "Récupération de la page à scrapper"
  page = get_page("https://www.annuaire-des-mairies.com/val-d-oise.html")
  print "Page à scrapper récupérée avec succès\nScrappage des URLs des villes du Val d'Oise en cours\n"
  url_cities_array = get_url_cities_array(page)
  print "Scrappage desdites villes effectué avec succès\nScrappge des emails de chaque ville en cours\n"
  # créer un tableau contenant tous les emails des mairies des villes du Val d'Oise
  townhalls_emails_array = []
  url_cities_array.each do |townhall_url| # prend du temps car charge à chaque fois une page HTML
    townhalls_emails_array.push(get_townhall_email_hash(townhall_url))
    print "." # affichage pour simuler le chargement
  end
  puts townhalls_emails_array
  puts "\nAffichage effectué avec succès\nFin du programme"
  return townhalls_emails_array
end

# Programme Principal
perform
