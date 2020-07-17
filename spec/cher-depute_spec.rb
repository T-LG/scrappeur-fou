require_relative '../lib/cher-depute'

# affichage initial 
puts "Test cher-depute lancé, en train de tester le programme"

#perform
describe "perform method" do
  it "perform return an array" do
    expect(perform).to be_instance_of Array
  end
  it "should not be nil" do 
    expect(perform).not_to be_nil
  end
end