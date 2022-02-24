module V1
  class ContactSerializer < ActiveModel::Serializer
    include ErrorSerializer
    attributes :id, :name, :email, :birthdate #, :author

    has_many :phones do
      link(:related) { v1_contact_phones_url(object.id) }
    end

    has_one :address do
      link(:related) { v1_contact_address_url(object.id) }
    end

    # link(:self) { contact_url(object.id) }

    belongs_to :kind do
      link(:related) { v1_contact_kind_url(object.id) }
    end

    def attributes(*args)
      h = super(*args)
      # PT-BR --> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank? )
      h[:birthdate] = (object.birthdate.to_time.iso8601 unless object.birthdate.blank?)
      return h
    end
  end
end
