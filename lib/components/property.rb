class Property
  attr_accessor :improvements, :set, :title, :value, :status, :owner

  def initialize(title, value, set)
    @title = title
    @value = value
    @set = set
    @improvements = []
    @status = 'purchasable'
    @owner = nil
    calculate_rent
  end

  def is_a_business?
    business_types = %w(railroad utility)
    business_types.include?(@set)
  end

  def add_improvement(improvement)
    @improvements << improvement unless is_a_business?
  end

  def calculate_rent
    scheme = RentalScheme.new(self)
    @rent = scheme.amount
  end

  def rent
    @rent
  end

  def is_mortgaged?
    true if @status == 'mortgaged'
  end

end