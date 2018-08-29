class Item < ApplicationRecord
  has_many :carts_items
  has_and_belongs_to_many :carts
end
