# Class comment
class Set
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def complete?
    true if player.owns_monopoly?(self)
  end
end
