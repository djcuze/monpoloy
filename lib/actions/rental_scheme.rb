class RentalScheme
  attr_accessor :property
  attr_reader :exception, :amount

  def initialize(property)
    @property = property
    property.is_a_business? ? commercial : residential
  end

  def commercial
    scheme = {
        "railroad" => 25,
        'utility' => 30
    }
    @amount = scheme[@property.set]
  end

  def residential
    num_of_dwellings = @property.improvements.count
    adjustment = {
        0 => 1,
        1 => 5,
        2 => 15,
        3 => 45,
        4 => 70,
        5 => 145
    }
    @amount = @property.value / 12 * adjustment[num_of_dwellings]
  end
end