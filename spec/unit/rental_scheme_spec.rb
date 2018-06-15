require './lib/actions/rental_scheme'

RSpec.describe RentalScheme do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}

  it 'has a property value and a number of dwellings' do
    scheme = RentalScheme.new(property)
    expect(scheme.property_value).to eq(60)
    expect(scheme.calculate).to eq(5)
  end

end