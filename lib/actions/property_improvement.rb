class PropertyImprovement
  attr_reader :improvement, :property

  def process_for(property)
    @property = property
    @improvement = self.determine_improvement_type
    self.process
  end

  def process
    begin
      raise TooManyImprovementsError if @property.improvements.count > 4
      @property.add_improvement(@improvement)
      @property.calculate_rent
    rescue TooManyImprovementsError => error
      return 'Error: Property is at improvement limit'
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
