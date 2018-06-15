require './lib/components/property'

RSpec.describe RentalScheme do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}

  it 'calculates its rent on creation' do
    expect(property.rent).to eq(5)
  end

end