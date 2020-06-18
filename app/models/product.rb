class Product < ApplicationRecord
  # Associations
  has_many :variants, dependent: :destroy
  accepts_nested_attributes_for :variants, allow_destroy: true

  # Callbacks
  after_save :touch_variants

  # Validations
  validates :title, presence: true

  # Methods
  def touch_variants
    variants.map(&:save)
  end
end
