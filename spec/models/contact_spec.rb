require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is valid with name, email, birthdate and kind' do
    contact = create(:contact)
    expect(contact).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birthdate) }
    it { is_expected.to validate_presence_of(:kind) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:kind) }
    it { is_expected.to have_many(:phones) }
    it { is_expected.to have_one(:address) }
  end

  context 'Instance Methods' do
    it '#hello' do
      contact = create(:contact)
      expect(contact.hello).to eq('Hola mundo')
    end
    it '#i18n' do
      contact = create(:contact)
      expect(contact.i18n).to eq(:es)
    end
  end
end
