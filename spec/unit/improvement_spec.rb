require './lib/actions/rental_scheme'
require './lib/components/improvement'

RSpec.describe Improvement do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:player) {Player.new}

  it 'creates a house object if less than 4 houses exist for the property' do
    player.make_an_improvement(property)
    improvement = property.improvements.first
    class_name = improvement.class.name
    expect(class_name).to eq('House')
  end

  context 'when a property already has four (4) improvements' do
    before(:each) do
      property.improvements = ['', '', '', '']
      player.make_an_improvement(property)
      improvement = property.improvements.last
      @class_name = improvement.class.name
    end
    it 'creates a hotel object' do
      expect(@class_name).to eq('Hotel')
    end

    it 'will not improve if a hotel exists' do
      player.make_an_improvement(property)
      count = property.improvements.count
      expect(count).not_to eq(6)
    end
  end
end