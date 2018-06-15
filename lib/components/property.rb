class Property
  attr_accessor :improvements, :set, :title, :value

  def initialize(title, value, set)
    @title = title
    @value = value
    @set = set
    @improvements = []
    self.calculate_rent
  end

  def add_improvement(improvement)
    @improvements << improvement
  end

  def calculate_rent
    scheme = RentalScheme.new(self)
    @rent = scheme.calculate
  end

  def rent
    @rent
  end

end