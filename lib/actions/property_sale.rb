# Class comment
class PropertySale
  attr_reader :property, :buyer

  def initialize(buyer)
    @buyer = buyer
  end

  def process_for(property)
    @property = property
    transfer_ownership if buyer.funds >= property.value
  end

  def approved?
    property.owner == buyer
  end

  def transfer_ownership
    buyer.owned_properties << property
    property.owner = buyer
  end
end
