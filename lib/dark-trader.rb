require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Retourne la page à scrapper
def get_page(url_page)
  return Nokogiri::HTML(open(url_page))
end 

# Retourne et affiche un tableau contenant les symboles des cryptomonnaies à partir de la page à scrapper
def get_symbols_array(page)
  # déclaration des variables locales 
  symbols = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
  symbols_array = [] 
  # scrapping 
  symbols.each do |symbol| # each, à partir de la version de ruby 1.8, ne marche qu'avec les entiers, d'ou la méthode text en dessous
    symbols_array << symbol.text
    print "." # affichage pour simuler l'animation de chargement
  end
  # affichage et retour 
  puts "\n#{symbols_array}" # affichage du résultat
  return symbols_array
end

# Retourne et affiche un tableau contenant les prix des cryptomonnaies à partir de la page à scrapper  
def get_prices_array(page)
  # variables locales 
  prices = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
  prices_array = []
  # scrapping 
  prices.each do |price|
    prices_array << price.text[1..-1].to_f # each, à partir de la version de ruby 1.8, ne marche qu'avec les entiers, d'ou la méthode text en dessous
    print "." # affichage pour simuler l'animation de chargement 
  end
  # affichage et retour
  puts "\n#{prices_array}" # affichage du résulat 
  return prices_array
end 

# Retourne et affiche un tableau de hashs de clés 
def get_crypto_info(symbols_array, prices_array)
  # variables locales
  crypto_info = []
  # Association de chaque element de symbols array à prices_array
  symbols_array.each_with_index do |k, v|
    crypto_info << {k => (prices_array)[v]} # ajout d'un hash k:v dans le tableau
    print "." # affichage pour simuler l'animation du chargement 
  end
  # affichage et retour
  puts "\n#{crypto_info}" # affichage du résulat 
  return crypto_info
end

# Méthode princiaple (perform), retourne crypto_info
def perform
  puts "Récupération de la page à scrapper"
  page = get_page("https://coinmarketcap.com/all/views/all/")
  print "Page à scrapper récupérée avec succès\nScrappage des symboles en cours\n"
  symbols_array = get_symbols_array(page)
  print "Scrappage des symboles effectué avec succès\nScrappge des prix en cours\n"
  prices_array = get_prices_array(page)
  print "Scrappge des prix effectué avec succès\nAffichage du bilan résulant en cours\n"
  crypto_info = get_crypto_info(symbols_array, prices_array)
  puts "\nAffichage effectué avec succès\nFin du programme"
  return crypto_info
end

# Programme Principal
perform
