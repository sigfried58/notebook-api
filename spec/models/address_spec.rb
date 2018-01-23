require 'rails_helper'

RSpec.describe Address, type: :model do
  it "is valid with street, city, contact" do
    address = create(:address)
    expect(address).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:contact) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:contact) }
  end
end
