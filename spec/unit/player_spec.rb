require './require'

RSpec.describe Player do
  let(:property) { Property.new('Whitechapel Road', 60, 'brown') }

  it 'expects a player to begin with 500 dollars' do
    player = Player.new
    expect(player.funds).to eq(500)
  end

  it 'can make a purchase' do
    player = Player.new
    player.make_an_improvement(property)
    expect(player.funds).to eq(464.0)
  end

end