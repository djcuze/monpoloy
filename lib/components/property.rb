# Class comment
class Property
  attr_accessor :improvements, :set, :title, :value, :status, :owner
  attr_reader :rent

  def initialize(title, value, set)
    @title = title
    @value = value
    @set = set
    @improvements = []
    @status = 'purchasable'
    @owner = nil
    calculate_rent
  end

  def a_business?
    business_types = %w[railroad utility]
    business_types.include?(@set)
  end

  def add_improvement(improvement)
    @improvements << improvement unless a_business?
  end

  def calculate_rent
    scheme = RentalScheme.new(self)
    @rent = scheme.amount
  end

  def mortgaged?
    @status == 'mortgaged'
  end
end
