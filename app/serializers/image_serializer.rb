class ImageSerializer < ActiveModel::Serializer
  attributes :id, :name, :file, :average_value, :theme_id
end
