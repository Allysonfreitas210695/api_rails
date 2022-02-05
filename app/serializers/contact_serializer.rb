class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  belongs_to :kind
  has_many :phones
  has_one :address

  link(:self) { contact_path(object.id) }
  
  # def author
  #   'Allyson Bruno'
  # end

  def attributes(*args)
    h = super(*args)
    # PT-BR --> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank? )
    h[:birthdate] = (object.birthdate.to_time.iso8601 unless object.birthdate.blank?)
    return h
  end
end
