require_relative '../lib/dark-trader'

# affichage initial 
puts "Test dark-trader lancé, en train de tester le programme"

# variables de test
url_page = "https://www.coinmarketcap.com/all/views/all/"
page = get_page(url_page)
symbols_array = get_symbols_array(page)
prices_array = get_prices_array(page)
crypto_info = get_crypto_info(symbols_array, prices_array)

# get_page
describe "get_page method" do
  it "should not be nil" do 
    expect(get_page(url_page)).not_to be_nil
  end
end
# get_symbols_array
describe "get_symbols_array" do
  it "should return an array" do
    expect(get_symbols_array(page)).to be_instance_of Array
  end
  it "should not be nil" do 
    expect(get_symbols_array(page)).not_to be_nil
  end
  it "should return an array of 200 elements" do
    expect(get_symbols_array(page).length).to be(200)
  end
  it "should have BTC in the array that it returns" do
    expect(get_symbols_array(page).include? "BTC").to be(true)
  end
  it "should have ETH in the array that it returns" do
    expect(get_symbols_array(page).include? "ETH").to be(true)
  end
end
#get_prices_array
describe "get_prices_array method" do
  it "should return an array" do
    expect(get_prices_array(page)).to be_instance_of Array
  end
  it "should not be nil" do 
    expect(get_prices_array(page)).not_to be_nil
  end
  it "should return an array of 200 elements" do
    expect(get_prices_array(page).length).to be(200)
  end
end
#get_crypto_info
describe "get_crypto_info method" do
  it "should return an array" do
    expect(get_crypto_info(symbols_array, prices_array)).to be_instance_of Array
  end
  it "should not be nil" do 
    expect(get_crypto_info(symbols_array, prices_array)).not_to be_nil
  end
  it "should return an array of 200 elements" do
    expect(get_crypto_info(symbols_array, prices_array).length).to be(200)
  end
end
#perform
describe "perform method" do
  it "perform return an array" do
    expect(perform).to be_instance_of Array
  end
  it "should not be nil" do 
    expect(perform).not_to be_nil
  end
  it "should return an array of 200 elements" do
    expect(perform.length).to be(200)
  end
end

#affichage final
puts "\ntest terminé avec succès"
