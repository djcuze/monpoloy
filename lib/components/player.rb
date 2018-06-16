class Player
  attr_accessor :funds, :name

  def initialize(name = nil)
    @name = name
    @funds = 500
  end

  def make_an_improvement(property)
    improvement = PropertyImprovement.new
    purchase(improvement) if improvement.process_for(property)
  end

  def purchase(item)
    @funds -= item.value
  end

  def pay(player, amount)
    @funds -= amount
    player.funds += amount
  end

end