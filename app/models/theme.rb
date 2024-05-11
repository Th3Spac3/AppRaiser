class Theme < ApplicationRecord
  has_many :images, dependent: :destroy
  scope :find_theme_id, -> (theme) {
    select(theme_id).where(theme)
  }
end
