class Improvement

  def initialize(value)
    @value = value
  end

  def build_on(property)
    property.add_improvement(self)
  end
end