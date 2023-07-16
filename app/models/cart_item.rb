# frozen_string_literal: true
# CartItem class represents an item in a shopping cart.
class CartItem < ApplicationRecord
  belongs_to :item
end
