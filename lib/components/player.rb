# Class Comment
class Player
  attr_accessor :funds, :name, :owned_properties

  def initialize(name = nil)
    @name = name
    @funds = 500
    @owned_properties = []
  end

  def make_an_improvement(property)
    improvement = PropertyImprovement.new
    purchase(improvement) if improvement.process_for(property)
  end

  def buy_a_property(property)
    sale = PropertySale.new(self)
    sale.process_for(property)
    purchase(property) if sale.approved?
  end

  def owns_a_monopoly?(set)
    check = MonopolyCheck.new(set)
    check.check_sets_for_properties(owned_properties)
  end

  def purchase(item)
    @funds -= item.value
  end

  def pay(player, amount)
    @funds -= amount
    player.funds += amount
  end
end
