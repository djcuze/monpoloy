class Property
  attr_accessor :improvements, :set, :title, :value

  def initialize(title, value, set)
    @title = title
    @value = value
    @set = set
    @improvements = []
    self.calculate_rent
  end

  def is_a_business?
    business_types = %w(railroad utility)
    business_types.include?(@set)
  end

  def add_improvement(improvement)
    begin
      raise IncorrectSetError if is_a_business?
      @improvements << improvement
    rescue IncorrectSetError => error
      # TODO: catch the error and make it matter
    end
  end

  def calculate_rent
    scheme = RentalScheme.new(self)
    @rent = scheme.residential
  end

  def rent
    @rent
  end

end