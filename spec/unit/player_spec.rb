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

  it 'can pay another player' do
    player_1 = Player.new
    player_2 = Player.new
    player_1.pay(player_2, 200)
    # assumes a player's initial funds is equal to 500
    expect(player_1.funds).to eq(300)
    expect(player_2.funds).to eq(700)
  end

end