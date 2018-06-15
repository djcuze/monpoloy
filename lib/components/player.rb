class Player
  attr_reader :funds, :name

  def initialize(name = nil)
    @name = name
    @funds = 500
  end

  def make_an_improvement(property)
    improvement = PropertyImprovement.new(property)
    purchase(improvement) if improvement
  end

  def purchase(item)
    @funds -= item.value
  end
  
end