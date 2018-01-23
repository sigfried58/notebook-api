class Phone < ApplicationRecord
  belongs_to :contact, optional: true
  validates :number, :contact, presence: true
end
