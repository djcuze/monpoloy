class RentalScheme
  attr_accessor :property_value

  def initialize(property)
    @property_value = property.value
    @num_of_dwellings = property.improvements.count
    self.calculate
  end

  def calculate
    adjustment = {
        0 => 1,
        1 => 5,
        2 => 15,
        3 => 45
    }
    @property_value / 12 * adjustment[@num_of_dwellings]
  end
end