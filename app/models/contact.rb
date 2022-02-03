class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  accepts_nested_attributes_for :phones, allow_destroy: true

  # def birthdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end
  #
  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end
  # def autor
  #   'Allyson bruno'
  # end
  #
  # def kind_description
  #   self.kind.description
  # end
  #

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

end
