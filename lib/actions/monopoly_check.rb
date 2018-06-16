class MonopolyCheck
  attr_reader :set, :property_counts

  def initialize(set)
    @set = set
    @property_counts = {
        'brown' => 2,
        'dark_blue' => 2,
        'utility' => 2,
        'light_blue' => 3,
        'pink' => 3,
        'orange' => 3,
        'red' => 3,
        'yellow' => 3,
        'green' => 3,
        'railroad' => 4
    }
  end

  def check_sets_for_properties(player)
    @count = 0
    player.owned_properties.each do |property|
      @count += 1 if property.set == @set
    end
    @count == @property_counts[@set]
  end
end