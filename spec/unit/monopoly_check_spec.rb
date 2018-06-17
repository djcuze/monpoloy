require './require'

RSpec.describe MonopolyCheck do
  let(:set) {Set.new('brown')}
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:property_2) {Property.new('Old Kent Road', 60, 'brown')}
  let(:player) {Player.new}
  let(:check) {MonopolyCheck.new(property.set)}
  let(:owned_properties) {player.owned_properties}

  it 'expects to be false' do
    result = check.count_properties(owned_properties)
    expect(result).to be false
  end

  it 'should be true when all properties of a set are owned by a player' do
    owned_properties << property
    owned_properties << property_2
    result = check.count_properties(owned_properties)
    expect(result).to be true
  end

  it 'should be false if only one property of a set is owned by a player' do
    owned_properties << property
    result = check.count_properties(owned_properties)
    expect(result).to be false
  end

end