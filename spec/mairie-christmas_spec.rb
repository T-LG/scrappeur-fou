require_relative '../lib/mairie-christmas'

# affichage initial 
puts "Test mairie-christmas lancé, en train de tester le programme"

#perform
describe "perform method" do
  it "perform return an array" do
    expect(perform).to be_instance_of Array
  end
  it "should not be nil" do 
    expect(perform).not_to be_nil
  end
  it "should return an array of 185 elements" do
    expect(perform.length).to be(185)
  end
  it "should have a specific element in the array that it returns" do
    expect(get_symbols_array(page).include? {"VILLIERS-LE-SEC"=>"mairie.wy-dit-joli-village@wanadoo.fr"}).to be(true)
  end
end

#affichage final
puts "\ntest terminé avec succès"