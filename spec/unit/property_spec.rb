require './lib/components/property'

RSpec.describe RentalScheme do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:railroad) {Property.new('St Kilda Station', 200, 'railroad')}

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

  it 'is a business if a railroad' do
    expect(railroad.is_a_business?).to be true
  end

  it 'is not a business if not a railroad or utility' do
    expect(property.is_a_business?).to be false
  end
end