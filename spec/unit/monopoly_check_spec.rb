require './require'

RSpec.describe MonopolyCheck do
  let(:set) {Set.new('brown')}
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:property_2) {Property.new('Old Kent Road', 60, 'brown')}
  let(:player) {Player.new}
  let(:check) {MonopolyCheck.new(property.set)}

  it 'expects to be false' do
    result = check.check_sets_for_properties(player)
    expect(result).to be false
  end

  it 'should be true when all properties of a set are owned by a player' do
    player.owned_properties << property
    player.owned_properties << property_2
    result = check.check_sets_for_properties(player)
    expect(result).to be true
  end

  it 'should be false if only one property of a set is owned by a player' do
    player.owned_properties << property
    result = check.check_sets_for_properties(player)
    expect(result).to be false
  end

end