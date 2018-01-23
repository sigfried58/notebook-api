require 'rails_helper'

RSpec.describe Kind, type: :model do
  it "is valid with description" do
    kind = create(:kind)
    expect(kind).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:description) }
  end
end
