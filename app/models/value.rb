class Value < ApplicationRecord
  belongs_to :user
  scope :user_valued_exists, -> (user_id, image_id) {
    value_exist = get_user_image_value(user_id, image_id)
    value_exist.empty? ? 0 : 1
  }
  scope :all_values, -> (image_id) {
    select('value').where(image_id: image_id)
  }
  scope :set_value, -> (image_id, user_id, value) {
    id = select('id').where(image_id: image_id, user_id: user_id)
    update(id, value: value)
  }
  scope :get_user_image_value, -> (user_id, image_id) {
    select('user_id', 'image_id', 'value').where(user_id: user_id, image_id: image_id)
  }

  scope :get_user_value, -> (user_id) {
    select('user_id', 'image_id', 'value').where(user_id: user_id)
  }
end
