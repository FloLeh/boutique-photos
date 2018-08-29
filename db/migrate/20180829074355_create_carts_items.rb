class CreateCartsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_items, id: false do |t|
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :item, foreign_key: true
    end
  end
end
