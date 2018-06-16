require './lib/components/property'
require './lib/actions/property_sale'

RSpec.describe PropertySale do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:player) {Player.new}

  it 'changes ownership of a property on successful sale' do
    player.buy_a_property(property)
    expect(property.owner).to eq(player)
    expect(player.owned_properties.include?(property)).to be true
  end
end