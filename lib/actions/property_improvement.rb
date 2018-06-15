class PropertyImprovement
  attr_reader :improvement, :property

  def initialize(property)
    @property = property
    @improvement = self.determine_improvement_type
    self.process ? true : false
  end

  def process
    begin
      raise TooManyImprovementsError if @property.improvements.count > 4
      @property.add_improvement(@improvement)
    rescue TooManyImprovementsError => error
      false
    end
  end

  def value
    @property ? 0.6 * @property.value : nil
  end

  def determine_improvement_type
    improvement_count = @property.improvements.count
    improvement_count < 4 ? House.new(value) : Hotel.new(value)
  end

end