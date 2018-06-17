# A Class Comment
class MonopolyCheck
  def initialize(set)
    @set = set
    @required_count = no_of_properties_in_the_set
  end

  def count_properties(owned_properties)
    properties = owned_properties.select { |property| property.set == @set }
    properties.count == @required_count
  end

  def no_of_properties_in_the_set
    case @set
    when 'brown' || 'dark_blue' || 'utility' then
      2
    when 'railroad' then
      4
    else
      3
    end
  end
end
