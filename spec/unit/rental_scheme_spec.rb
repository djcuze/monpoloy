require './lib/actions/rental_scheme'

RSpec.describe RentalScheme do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:railroad) {Property.new('St Kilda Station', 200, 'railroad')}

  it 'has a property value and a number of dwellings' do
    scheme = RentalScheme.new(property)
    expect(scheme.property.value).to eq(60)
    expect(scheme.residential).to eq(5)
  end

  it 'has a unique rent amount if a railroad' do
     expect(railroad.rent).to eq(25)
  end
end