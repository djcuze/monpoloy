require './require'

RSpec.describe Set do
  let(:property) {Property.new('Whitechapel Road', 60, 'brown')}
  let(:set) {Set.new('green')}

  it 'has a name' do
    expect(set.name).to eq('green')
  end

  it 'is complete if ' do

  end
end