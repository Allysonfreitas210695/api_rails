class Address < ApplicationRecord
  belongs_to :contact

  validates_presence_of :contact
end
