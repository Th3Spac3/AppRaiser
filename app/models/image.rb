class Image < ApplicationRecord
  has_many :values, dependent: :destroy
  belongs_to :theme

  scope :theme_images, -> (theme_id) {
    select('id', 'name', 'file', 'average_value').where(theme_id: theme_id)
  }
  scope :find_image, -> (image_id) {
    select('id', 'name', 'file', 'average_value').where(image_id: image_id)
  }
  scope :refresh_value, -> (image_id) {
    values = Value.all_values(image_id)
    update(image_id , average_value: values.empty? ? 0 : values.average('value') )
  }
end
