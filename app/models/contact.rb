class Contact < ApplicationRecord
  
  # Validations
  validates_presence_of :kind
  # validates_presence_of :address
  
  # Kaminari
   paginates_per 10

  # Asociaciones
  belongs_to :kind #, optional: true
  has_many :phones
  has_one :address

  validates :name, :email, :birthdate, :kind, presence: true
  
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true
  
  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

  # def birthdate_es
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

#  def to_es
#    {
#      name: self.name,
#      email: self.email,
#      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
#    }
#  end
#  def author
#    'Jackson Pires'
#  end

#  def kind_description
#    self.kind.description
#  end

#  def as_json(options={})
#    super(
#      root: true,
#      methods: [:kind_description, :author],
#      include: { kind: { only: :description } }
#      )
#  end
  def hello
    I18n.t('hello')
  end

  def i18n
    I18n.default_locale
  end
end
