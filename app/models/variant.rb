class Variant < ApplicationRecord
  # Associations
  belongs_to :product

  # Callbacks
  before_save :update_final_price

  # Methods
  def update_final_price
    if product.vat.to_i > 0
      self.final_price = price + ((price * product.vat) / 100)
    else
      self.final_price = price
    end
  end
end
