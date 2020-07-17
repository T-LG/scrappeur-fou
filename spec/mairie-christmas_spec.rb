require_relative '../lib/mairie-christmas'

# affichage initial 
puts "Test mairie-christmas lancé, en train de tester le programme"

# get_townhall_email
describe "get_townhall_email method" do 
  it "gives a good url" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/nerville-la-foret.html")).to eq({"nerville-la-foret"=>"mairie-nerville95@wanadoo.fr"})
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
  it "should return an array of 185 elements" do
    expect(perform.length).to be(185)
  end
  it "should contain an element" do 
    expect(perform[10]).to eq ({"Attainville"=>"mairie@attainville.fr"})
  end
end

#affichage final
puts "\ntest terminé avec succès"
