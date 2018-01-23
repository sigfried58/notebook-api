class Address < ApplicationRecord
  belongs_to :contact, optional: true
  validates :street, :city, :contact, presence: true
end
