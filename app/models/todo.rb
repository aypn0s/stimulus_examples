class Todo < ApplicationRecord
  # Validations
  validates :title, presence: true
end
