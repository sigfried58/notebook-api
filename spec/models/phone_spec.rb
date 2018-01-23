require 'rails_helper'

RSpec.describe Phone, type: :model do
  it "is valid with number, contact" do
    phone = create(:phone)
    expect(phone).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:contact) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:contact) }
  end
end
