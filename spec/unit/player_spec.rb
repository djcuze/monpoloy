require './require'

RSpec.describe Player do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:player) {Player.new}

  it 'expects a player to begin with 500 dollars' do

    expect(player.funds).to eq(500)
  end

  it 'can make a purchase' do
    player.make_an_improvement(property)
    expect(player.funds).to eq(464.0)
  end

  it 'can pay another player' do
    player_2 = Player.new
    player.pay(player_2, 200)
    # assumes a player's initial funds is equal to 500
    expect(player.funds).to eq(300)
    expect(player_2.funds).to eq(700)
  end

  it 'expects a player to begin the game with no owned properties' do
    expect(player.owned_properties.count).to eq(0)
  end

  it 'can purchase a property' do
    player.buy_a_property(property)
    expect(property.owner).to eq(player)
    expect(player.funds).to eq(440)
  end

end