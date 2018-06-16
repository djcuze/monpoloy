require './lib/actions/property_improvement'

RSpec.describe PropertyImprovement do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:improvement) {PropertyImprovement.new}

  it 'provides feedback when an attempt to purchase an improvement is made whilst property has reached improvement capacity ceiling' do
    property.improvements = [1, 2, 3, 4, 5]
    process = improvement.process_for(property)
    expect(process).to eq('Error: Property is at improvement limit')
  end

  it "adjusts the property's rent after an improvement has been made" do
    expect(property.rent).to eq(5)
    # 1 House
    improvement.process_for(property)
    expect(property.rent).to eq(25)
    # 2 Houses
    improvement.process_for(property)
    expect(property.rent).to eq(75)
    # 3 Houses
    improvement.process_for(property)
    expect(property.rent).to eq(225)
    # 4 houses
    improvement.process_for(property)
    expect(property.rent).to eq(350)
    # Hotel
    improvement.process_for(property)
    expect(property.rent).to eq(725)
  end


end