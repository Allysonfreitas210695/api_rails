class KindSerializer < ActiveModel::Serializer
  attributes :id, :description

  link(:kinds) { kind_path(object.id) }
end
