require './lib/components/property'

RSpec.describe RentalScheme do
  let(:property) { Property.new('Whitechapel Road', 60, 'brown') }
  let(:player) { Player.new }
  let(:railroad) { Property.new('St Kilda Station', 200, 'railroad') }

  it 'calculates its rent on creation' do
    expect(property.rent).to eq(5)
  end

  it "adds to the improvements array" do
    add_improvement = property.add_improvement('foo')
    expect(property.improvements.count).to be(1)
  end

  it "doesn't add an improvement if set type railroad" do
    add_improvement = railroad.add_improvement('foo')
    expect(add_improvement).to be nil
    expect(railroad.improvements.count).not_to be(1)
  end

  it 'is a business if a railroad but not a business if a property' do
    expect(railroad.a_business?).to be true
    expect(property.a_business?).to be false
  end

  it 'can be mortgaged' do
    property.status = 'mortgaged'
    expect(property.mortgaged?).to be true
  end

  it 'begins the game with a status of purchasable and an owner of nil' do
    expect(property.status).to eq('purchasable')
    expect(property.owner).to be nil
  end
end